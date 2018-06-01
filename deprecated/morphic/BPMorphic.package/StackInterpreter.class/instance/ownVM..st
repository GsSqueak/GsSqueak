vm scheduling
ownVM: threadIndexAndFlags 
	"This is the entry-point for plugins and primitives that wish to
	reacquire the VM after having
	released it via disownVM or callbacks that want to acquire it without
	knowing their ownership
	status. While this exists for the threaded FFI VM we use it to reset
	newMethod and the
	argumentCount after a callback.
	
	Answer the argumentCount encoded as a SmallInteger if the current
	thread is the VM thread.
	Answer -1 if the current thread is unknown to the VM and fails to take
	ownership. "
	| _gsSqueakTemp_amInVMThread |
	self
		cCode: []
		inSmalltalk: [_gsSqueakTemp_amInVMThread := 1.
			_gsSqueakTemp_amInVMThread class].
	self amInVMThread
		ifFalse: [^ -1].
	self assert: primFailCode = 0.
	self
		assert: ((objectMemory isOopCompiledMethod: newMethod)
				and: [(self argumentCountOf: newMethod)
						= argumentCount]).
	self push: newMethod.
	^ objectMemory integerObjectOf: argumentCount