process primitives
primitiveSuspend
	"Primitive. Suspend the receiver, aProcess such that it can be
	executed again
	by sending #resume. If the given process is not currently running,
	take it off
	its corresponding list. The primitive returns the list the receiver was
	previously on."
	| _gsSqueakTemp_process _gsSqueakTemp_myList |
	_gsSqueakTemp_process := self stackTop.
	_gsSqueakTemp_process = self activeProcess
		ifTrue: [self pop: 1 thenPush: objectMemory nilObject.
			^ self transferTo: self wakeHighestPriority].
	_gsSqueakTemp_myList := objectMemory fetchPointer: MyListIndex ofObject: _gsSqueakTemp_process.
	"XXXX Fixme. We should really check whether myList is a kind of
	LinkedList or not
	but we can't easily so just do a quick check for nil which is the most
	common case."
	_gsSqueakTemp_myList = objectMemory nilObject
		ifTrue: [^ self primitiveFailFor: PrimErrBadReceiver].
	"Alas in Spur we need a read barrier"
	(objectMemory isForwarded: _gsSqueakTemp_myList)
		ifTrue: [_gsSqueakTemp_myList := objectMemory followForwarded: _gsSqueakTemp_myList.
			objectMemory
				storePointer: MyListIndex
				ofObject: _gsSqueakTemp_process
				withValue: _gsSqueakTemp_myList].
	self removeProcess: _gsSqueakTemp_process fromList: _gsSqueakTemp_myList.
	self successful
		ifTrue: [objectMemory
				storePointer: MyListIndex
				ofObject: _gsSqueakTemp_process
				withValue: objectMemory nilObject.
			self pop: 1 thenPush: _gsSqueakTemp_myList]