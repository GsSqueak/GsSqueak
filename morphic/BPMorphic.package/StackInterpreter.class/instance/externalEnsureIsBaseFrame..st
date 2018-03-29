frame access
externalEnsureIsBaseFrame: aFramePtr 
	"Ensure aFramePtr is a base frame. Then we can assign its sender.
	Answer the possibly moved location of the frame."
	| _gsSqueakTemp_theFP _gsSqueakTemp_thePage _gsSqueakTemp_onCurrent |
	(self isBaseFrame: aFramePtr)
		ifTrue: [^ aFramePtr].
	_gsSqueakTemp_theFP := aFramePtr.
	_gsSqueakTemp_thePage := stackPages stackPageFor: _gsSqueakTemp_theFP.
	_gsSqueakTemp_onCurrent := _gsSqueakTemp_thePage = stackPage.
	"Storing the frame's sender with its caller's context
	has the side effect of making theFP a base frame."
	_gsSqueakTemp_theFP := self
				storeSenderOfFrame: _gsSqueakTemp_theFP
				withValue: (self ensureCallerContext: _gsSqueakTemp_theFP).
	_gsSqueakTemp_onCurrent
		ifTrue: [self assert: stackPage ~~ _gsSqueakTemp_thePage.
			"stackPage has moved to a new page"
			self setStackPointersFromPage: stackPage]
		ifFalse: [stackPages markStackPageMostRecentlyUsed: stackPage].
	self assert: stackPages pageListIsWellFormed.
	self assert: stackPage = stackPages mostRecentlyUsedPage.
	^ _gsSqueakTemp_theFP