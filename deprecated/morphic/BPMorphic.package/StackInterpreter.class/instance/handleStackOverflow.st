message sending
handleStackOverflow
	"Check for stack overflow, moving frames to another stack if so.
	This should *only* be sent from checkForStackOverflow."
	| _gsSqueakTemp_newPage _gsSqueakTemp_theFP _gsSqueakTemp_callerFP _gsSqueakTemp_overflowLimitAddress _gsSqueakTemp_overflowCount |
	self assert: stackPointer < stackPage realStackLimit.
	self maybeTraceStackOverflow.
	statStackOverflow := statStackOverflow + 1.
	"The stack has overflowed this page. If the system is executing some
	recursive algorithm,
	e.g. fibonacci, then the system could thrash overflowing the stack if
	the call soon returns
	back to the current page. To avoid thrashing, since overflow is quite
	slow, we can move
	more than one frame. The idea is to record which page has
	overflowed, and the first
	time it overflows move one frame, the second time two frames, and so
	on. We move no
	more frames than would leave the page half occupied."
	_gsSqueakTemp_theFP := framePointer.
	stackPage = overflowedPage
		ifTrue: [_gsSqueakTemp_overflowLimitAddress := stackPage baseAddress - stackPages overflowLimit.
			_gsSqueakTemp_overflowCount := extraFramesToMoveOnOverflow := extraFramesToMoveOnOverflow + 1.
			[(_gsSqueakTemp_overflowCount := _gsSqueakTemp_overflowCount - 1) >= 0
				and: [(_gsSqueakTemp_callerFP := self frameCallerFP: _gsSqueakTemp_theFP) < _gsSqueakTemp_overflowLimitAddress
						and: [(self isBaseFrame: _gsSqueakTemp_callerFP) not]]]
				whileTrue: [_gsSqueakTemp_theFP := _gsSqueakTemp_callerFP]]
		ifFalse: [overflowedPage := stackPage.
			extraFramesToMoveOnOverflow := 0].
	self ensureCallerContext: _gsSqueakTemp_theFP.
	_gsSqueakTemp_newPage := stackPages newStackPage.
	self
		moveFramesIn: stackPage
		through: _gsSqueakTemp_theFP
		toPage: _gsSqueakTemp_newPage.
	self setStackPageAndLimit: _gsSqueakTemp_newPage.
	self setStackPointersFromPage: _gsSqueakTemp_newPage.
	self isCog
		ifTrue: [self
				assert: (self validInstructionPointer: instructionPointer + 1 inFrame: framePointer).
			self
				assert: ((self frameHasContext: framePointer) not
						or: [objectMemory
								isContext: (self frameContext: framePointer)])]
		ifFalse: ["To overflow the stack this must be a new frame, but in Cog
			base frames are married."
			self assert: (self frameHasContext: framePointer) not.
			self
				assert: (self
						validInstructionPointer: instructionPointer + 1
						inMethod: method
						framePointer: framePointer)]