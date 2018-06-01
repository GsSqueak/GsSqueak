memory space primitives
primitiveFetchNextMourner
	objectMemory dequeueMourner
		ifNil: [self primitiveFailFor: PrimErrNotFound]
		ifNotNil: [:mourner | self pop: 1 thenPush: mourner]