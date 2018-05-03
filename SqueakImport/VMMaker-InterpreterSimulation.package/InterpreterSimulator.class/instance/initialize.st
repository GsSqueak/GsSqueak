initialization
initialize

	"Initialize the InterpreterSimulator when running the interpreter inside
	Smalltalk. The primary responsibility of this method is to allocate
	Smalltalk Arrays for variables that will be declared as statically-allocated
	global arrays in the translated code."

	"copy of bytesPerWord to avoid extra indirection that may affect performance"
	bytesPerWord := objectMemory bytesPerWord.

	"initialize class variables"
	ObjectMemory initializeConstants.
	ContextInterpreter initialize.

	"Note: we must initialize ConstMinusOne differently for simulation,
		due to the fact that the simulator works only with +ve 32-bit values"
	ConstMinusOne := objectMemory integerObjectOf: -1.

	methodCache := Array new: MethodCacheSize.
	atCache := Array new: AtCacheTotalSize.
	self flushMethodCache.
	objectMemory setRootTable: (Array new: ObjectMemory rootTableSize).
	objectMemory setWeakRoots: (Array new: ObjectMemory rootTableSize + ObjectMemory remapBufferSize + 100).
	objectMemory setRemapBuffer: (Array new: ObjectMemory remapBufferSize).
	semaphoresUseBufferA := true.
	semaphoresToSignalA := Array new: SemaphoresToSignalSize.
	semaphoresToSignalB := Array new: SemaphoresToSignalSize.
	externalPrimitiveTable := CArrayAccessor on: (Array new: MaxExternalPrimitiveTableSize).
	primitiveTable := self class primitiveTable.
	pluginList := #().
	mappedPluginEntries := #().

	"initialize InterpreterSimulator variables used for debugging"
	byteCount := 0.
	sendCount := 0.
	quitBlock := [^ self].
	traceOn := true.
	myBitBlt := BitBltSimulator new setInterpreter: self.
	filesOpen := OrderedCollection new.
	objectMemory setHeaderTypeBytes: (CArrayAccessor on: (Array with: bytesPerWord * 2 with: bytesPerWord with: 0 with: 0)).
	transcript := Transcript.
	objectMemory transcript: Transcript.
	displayForm := 'Display has not yet been installed' asDisplayText form.
	