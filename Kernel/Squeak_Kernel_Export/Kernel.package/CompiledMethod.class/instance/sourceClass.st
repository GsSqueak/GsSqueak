source code management
sourceClass
	"Get my receiver class (method class) from the preamble of my source.  Return nil if not found."

	^ [(Compiler evaluate: (self sourceFileStream backChunk "blank"; backChunk "preamble")) theClass] on: Error do: [nil]