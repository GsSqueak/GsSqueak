plugin primitives
primitiveUnloadModule
	"Primitive. Unload the module with the given name."
	"Reloading of the module will happen *later* automatically, when a 
	function from it is called. This is ensured by invalidating current
	sessionID. "
	| _gsSqueakTemp_moduleName |
	self methodArgumentCount = 1
		ifFalse: [^ self primitiveFail].
	_gsSqueakTemp_moduleName := self stackTop.
	(objectMemory isIntegerObject: _gsSqueakTemp_moduleName)
		ifTrue: [^ self primitiveFail].
	(objectMemory isBytes: _gsSqueakTemp_moduleName)
		ifFalse: [^ self primitiveFail].
	(self
			ioUnloadModule: (self
					oopForPointer: (objectMemory firstIndexableField: _gsSqueakTemp_moduleName))
			OfLength: (objectMemory byteSizeOf: _gsSqueakTemp_moduleName))
		ifFalse: [^ self primitiveFail].
	self flushExternalPrimitives.
	self forceInterruptCheck.
	self pop: 1
	"pop moduleName; return receiver"