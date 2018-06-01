project parameters
projectParameterAt: aSymbol ifAbsent: aBlock
	"Answer the project parameter stored at the given symbol, or the result of evaluating the block"

	^ self projectParameters at: aSymbol ifAbsent: aBlock