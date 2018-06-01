process primitives
primitiveProfileSemaphore
	"Primitive. Install the semaphore to be used for profiling, 
	or nil if no semaphore should be used.
	See also primitiveProfileStart."
	| _gsSqueakTemp_sema |
	self methodArgumentCount = 1
		ifFalse: [^ self primitiveFailFor: PrimErrBadNumArgs].
	_gsSqueakTemp_sema := self stackValue: 0.
	(_gsSqueakTemp_sema = objectMemory nilObject
			or: [objectMemory isSemaphoreOop: _gsSqueakTemp_sema])
		ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
	profileSemaphore := _gsSqueakTemp_sema.
	profileProcess := profileMethod := objectMemory nilObject.
	self pop: 1