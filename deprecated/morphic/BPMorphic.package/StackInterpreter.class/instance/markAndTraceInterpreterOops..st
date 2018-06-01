object memory support
markAndTraceInterpreterOops: fullGCFlag 
	"Mark and trace all oops in the interpreter's state."
	"Assume: All traced variables contain valid oops.
	N.B. Don't trace messageSelector and lkupClass; these are ephemeral,
	live only during message lookup and because createActualMessageTo
	will not
	cause a GC these cannot change during message lookup."
	"Must mark stack pages first to initialize the per-page trace
	flags for full garbage collect before any subsequent tracing."
	| _gsSqueakTemp_oop |
	self markAndTraceStackPages: fullGCFlag.
	self markAndTraceTraceLog.
	self markAndTracePrimTraceLog.
	objectMemory markAndTrace: objectMemory specialObjectsOop.
	"also covers nilObj, trueObj, falseObj, and compact classes"
	(objectMemory isImmediate: newMethod)
		ifFalse: [objectMemory markAndTrace: newMethod].
	self traceProfileState.
	tempOop = 0
		ifFalse: [objectMemory markAndTrace: tempOop].
	tempOop2 = 0
		ifFalse: [objectMemory markAndTrace: tempOop2].
	"V3 memory manager support"
	1
		to: objectMemory remapBufferCount
		do: [:i | 
			_gsSqueakTemp_oop := objectMemory remapBuffer at: i.
			(objectMemory isImmediate: _gsSqueakTemp_oop)
				ifFalse: [objectMemory markAndTrace: _gsSqueakTemp_oop]].
	"Old callback support - trace suspended callback list"
	1
		to: jmpDepth
		do: [:i | 
			_gsSqueakTemp_oop := suspendedCallbacks at: i.
			(objectMemory isImmediate: _gsSqueakTemp_oop)
				ifFalse: [objectMemory markAndTrace: _gsSqueakTemp_oop].
			_gsSqueakTemp_oop := suspendedMethods at: i.
			(objectMemory isImmediate: _gsSqueakTemp_oop)
				ifFalse: [objectMemory markAndTrace: _gsSqueakTemp_oop]]