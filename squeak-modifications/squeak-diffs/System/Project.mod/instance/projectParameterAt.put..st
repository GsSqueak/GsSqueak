project parameters
projectParameterAt: aSymbol put: aValue
	"Set the given project parameter to the given value"

	self projectParameters at: aSymbol put: aValue.
	self noteThatParameter: aSymbol justChangedTo: aValue.
	^ aValue