frame access
externalDivorceFrame: theFP andContext: ctxt 
	"Divorce a single frame and its context. If it is not the top frame of a
	stack this means splitting its stack."
	| _gsSqueakTemp_thePage _gsSqueakTemp_onCurrent _gsSqueakTemp_theSP _gsSqueakTemp_callerCtx _gsSqueakTemp_newPage _gsSqueakTemp_frameAbove _gsSqueakTemp_callerFP _gsSqueakTemp_callerSP _gsSqueakTemp_callerIP _gsSqueakTemp_theIP |
	"stackPage needs to have current head pointers to avoid confusion."
	self
		assert: (stackPage = 0
				or: [stackPage = stackPages mostRecentlyUsedPage]).
	_gsSqueakTemp_thePage := stackPages stackPageFor: theFP.
	(_gsSqueakTemp_onCurrent := _gsSqueakTemp_thePage = stackPage)
		ifFalse: [stackPages markStackPageNextMostRecentlyUsed: _gsSqueakTemp_thePage].
	_gsSqueakTemp_theSP := self findSPOf: theFP on: _gsSqueakTemp_thePage.
	self updateStateOfSpouseContextForFrame: theFP WithSP: _gsSqueakTemp_theSP.
	_gsSqueakTemp_callerCtx := self ensureCallerContext: theFP.
	(_gsSqueakTemp_frameAbove := self findFrameAbove: theFP inPage: _gsSqueakTemp_thePage) = 0
		ifTrue: ["If we're divorcing the top frame we can simply peel it off."
			_gsSqueakTemp_theIP := stackPages longAt: _gsSqueakTemp_thePage headSP]
		ifFalse: ["othewise move all frames above to a new stack and then peel
			the frame off."
			_gsSqueakTemp_newPage := stackPages newStackPage.
			_gsSqueakTemp_theIP := self
						oopForPointer: (self frameCallerSavedIP: _gsSqueakTemp_frameAbove).
			_gsSqueakTemp_frameAbove := self
						moveFramesIn: _gsSqueakTemp_thePage
						through: _gsSqueakTemp_frameAbove
						toPage: _gsSqueakTemp_newPage.
			_gsSqueakTemp_onCurrent
				ifTrue: [self setStackPageAndLimit: _gsSqueakTemp_newPage.
					self setStackPointersFromPage: _gsSqueakTemp_newPage]
				ifFalse: [stackPages markStackPageMostRecentlyUsed: _gsSqueakTemp_newPage].
			self assert: (self frameCallerContext: _gsSqueakTemp_frameAbove)
					= ctxt].
	objectMemory
		storePointerUnchecked: InstructionPointerIndex
		ofObject: ctxt
		withValue: (self contextInstructionPointer: _gsSqueakTemp_theIP frame: theFP).
	objectMemory
		storePointer: SenderIndex
		ofObject: ctxt
		withValue: _gsSqueakTemp_callerCtx.
	_gsSqueakTemp_callerFP := self frameCallerFP: theFP.
	_gsSqueakTemp_callerFP = 0
		ifTrue: ["theFP is a base frame; it is now alone; free the entire page"
			stackPages freeStackPage: _gsSqueakTemp_thePage]
		ifFalse: [_gsSqueakTemp_callerIP := self
						oopForPointer: (self frameCallerSavedIP: theFP).
			_gsSqueakTemp_callerSP := (self frameCallerSP: theFP)
						- objectMemory wordSize.
			stackPages longAt: _gsSqueakTemp_callerSP put: _gsSqueakTemp_callerIP.
			self
				setHeadFP: _gsSqueakTemp_callerFP
				andSP: _gsSqueakTemp_callerSP
				inPage: _gsSqueakTemp_thePage]