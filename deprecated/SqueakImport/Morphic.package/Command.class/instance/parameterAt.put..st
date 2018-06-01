parameters
parameterAt: aSymbol put: aValue
	"Place aValue in the parameters dictionary using aSymbol as key"

	^ self assuredParameterDictionary at: aSymbol put: aValue