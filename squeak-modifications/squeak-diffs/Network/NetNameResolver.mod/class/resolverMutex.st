private
resolverMutex
	ResolverMutex ifNil: [ResolverMutex := Semaphore forMutualExclusion].
	^ResolverMutex