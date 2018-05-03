object memory support
preGCAction: fullGCFlag

	compilerInitialized
		ifTrue: [self compilerPreGC: fullGCFlag]
		ifFalse: [self storeContextRegisters: activeContext].