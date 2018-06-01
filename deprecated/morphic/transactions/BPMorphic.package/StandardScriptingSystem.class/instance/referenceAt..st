-Etoys-utilities
referenceAt: aSymbol 
	"Answer the object referred to by aSymbol in the 'References' scheme
	of things, or nil if none"
	^ References
		at: aSymbol
		ifAbsent: []