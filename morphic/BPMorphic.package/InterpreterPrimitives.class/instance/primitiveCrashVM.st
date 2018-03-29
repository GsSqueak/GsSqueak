system control primitives
primitiveCrashVM
	"Crash the VM by indirecting through a null pointer. If the sole
	argument is true crash in this thread, and if it is false crash in a new
	thread. If the
	argument is an integer use the method that implies.
	bit 0 = thread to crash in; 1 => this thread
	bit 1 = crash method; 0 => indirect through null pointer; 1 => call
	exit "
	| _gsSqueakTemp_crashInThisThread |
	(objectMemory isIntegerObject: self stackTop)
		ifTrue: [_gsSqueakTemp_crashInThisThread := objectMemory integerValueOf: self stackTop]
		ifFalse: [_gsSqueakTemp_crashInThisThread := self booleanValueOf: self stackTop].
	(self failed
			or: [argumentCount ~= 1])
		ifTrue: [^ self primitiveFailFor: PrimErrBadNumArgs].
	self crashInThisOrAnotherThread: _gsSqueakTemp_crashInThisThread.
	self pop: 1