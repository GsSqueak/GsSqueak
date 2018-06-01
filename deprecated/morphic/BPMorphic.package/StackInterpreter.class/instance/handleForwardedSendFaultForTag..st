message sending
handleForwardedSendFaultForTag: classTag 
	"Handle a send fault that may be due to a send to a forwarded object.
	Unforward the receiver on the stack and answer its actual class."
	| _gsSqueakTemp_rcvr |
	self
		assert: (objectMemory isForwardedClassTag: classTag).
	_gsSqueakTemp_rcvr := self stackValue: argumentCount.
	"should *not* be a super send, so the receiver should be forwarded."
	self
		assert: (objectMemory isOopForwarded: _gsSqueakTemp_rcvr).
	_gsSqueakTemp_rcvr := objectMemory followForwarded: _gsSqueakTemp_rcvr.
	self stackValue: argumentCount put: _gsSqueakTemp_rcvr.
	self followForwardedFrameContents: framePointer stackPointer: stackPointer + (argumentCount + 1 * objectMemory wordSize).
	"don't repeat effort"
	(objectMemory
			isPointers: (self frameReceiver: framePointer))
		ifTrue: [objectMemory
				followForwardedObjectFields: (self frameReceiver: framePointer)
				toDepth: 0].
	^ objectMemory fetchClassTagOf: _gsSqueakTemp_rcvr