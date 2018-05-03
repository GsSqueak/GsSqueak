*EnvironmentsEnv7-emulating
at: aSymbol ifAbsentPut: aBlock 
	^ self
		at: aSymbol
		ifAbsent: [self at: aSymbol put: aBlock value]
