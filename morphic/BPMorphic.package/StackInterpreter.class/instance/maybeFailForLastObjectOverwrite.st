primitive support
maybeFailForLastObjectOverwrite
	checkAllocFiller
		ifTrue: [(objectMemory freeStart < objectMemory scavengeThreshold
					and: [(objectMemory longAt: objectMemory freeStart)
							~= objectMemory freeStart])
				ifTrue: [self primitiveFailFor: PrimErrWritePastObject]]