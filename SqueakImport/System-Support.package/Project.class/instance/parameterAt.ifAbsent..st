project parameters
parameterAt: aSymbol ifAbsent: aBlock
	projectParameters ifNil:[^aBlock value].
	^projectParameters at: aSymbol ifAbsent: aBlock