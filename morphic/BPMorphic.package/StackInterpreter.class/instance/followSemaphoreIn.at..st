object memory support
followSemaphoreIn: anArray at: index 
	"Only follow the reference to the semaphore. synchronousSignal
	checks the chain to the suspendedContext."
	| _gsSqueakTemp_obj |
	_gsSqueakTemp_obj := objectMemory fetchPointer: index ofObject: anArray.
	(objectMemory isForwarded: _gsSqueakTemp_obj)
		ifTrue: [_gsSqueakTemp_obj := objectMemory followForwarded: _gsSqueakTemp_obj.
			objectMemory
				storePointer: index
				ofObject: anArray
				withValue: _gsSqueakTemp_obj]