parameters
parameterAt: aSymbol ifAbsent: aBlock
	"Answer the parameter stored at the aSymbol, but if none, return the result of evaluating aBlock"

	^ self assuredParameterDictionary at: aSymbol ifAbsent: aBlock