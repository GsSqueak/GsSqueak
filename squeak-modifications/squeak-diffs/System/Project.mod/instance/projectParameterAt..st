project parameters
projectParameterAt: aSymbol
	"Answer the project parameter stored at the given symbol, or nil if none"

	^ self projectParameters at: aSymbol ifAbsent: [nil]