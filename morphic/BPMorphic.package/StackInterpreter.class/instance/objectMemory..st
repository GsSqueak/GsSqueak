initialization
objectMemory: anObjectMemory 
	objectMemory
		ifNotNil: [self halt].
	objectMemory := anObjectMemory