message sending
handleSpecialSelectorSendFaultFor: obj fp: theFP sp: theSP 
	"Handle a special send fault that may be due to a special selector
	send accessing a forwarded object. obj is forwarded.
	Unforward stack contents and and inst vars and answer obj's target."
	| _gsSqueakTemp_rcvr |
	self
		assert: (objectMemory isOopForwarded: obj).
	self followForwardedFrameContents: theFP stackPointer: theSP.
	_gsSqueakTemp_rcvr := self frameReceiver: theFP.
	(objectMemory isPointers: _gsSqueakTemp_rcvr)
		ifTrue: [objectMemory followForwardedObjectFields: _gsSqueakTemp_rcvr toDepth: 0].
	^ objectMemory followForwarded: obj