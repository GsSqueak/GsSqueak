frame access
storeSenderOfFrame: theFP withValue: anOop 
	"Set the sender of a frame. If the frame is a base frame then this is
	trivial; merely store into the FoxCallerSavedIP/FoxCallerContext field. If
	not, then
	split the stack at the frame, moving the frame and those hotter than
	it to a
	new stack page. In the new stack page the frame will be the base
	frame and storing trivial. Answer the possibly changed location of
	theFP. "
	| _gsSqueakTemp_thePage _gsSqueakTemp_onCurrentPage _gsSqueakTemp_newPage _gsSqueakTemp_theMovedFP |
	(self isBaseFrame: theFP)
		ifTrue: [self frameCallerContext: theFP put: anOop.
			^ theFP].
	self ensureCallerContext: theFP.
	_gsSqueakTemp_thePage := stackPages stackPageFor: theFP.
	self assert: stackPage = stackPages mostRecentlyUsedPage.
	_gsSqueakTemp_onCurrentPage := _gsSqueakTemp_thePage = stackPage.
	_gsSqueakTemp_onCurrentPage
		ifFalse: ["Make sure the frame's page isn't divorced when a new page is
			allocated. "
			stackPages markStackPageNextMostRecentlyUsed: _gsSqueakTemp_thePage].
	_gsSqueakTemp_newPage := stackPages newStackPage.
	_gsSqueakTemp_theMovedFP := self
				moveFramesIn: _gsSqueakTemp_thePage
				through: theFP
				toPage: _gsSqueakTemp_newPage.
	_gsSqueakTemp_onCurrentPage
		ifTrue: [self setStackPageAndLimit: _gsSqueakTemp_newPage]
		ifFalse: [stackPages markStackPageMostRecentlyUsed: _gsSqueakTemp_newPage].
	self
		assert: (self isBaseFrame: _gsSqueakTemp_theMovedFP).
	self frameCallerContext: _gsSqueakTemp_theMovedFP put: anOop.
	^ _gsSqueakTemp_theMovedFP