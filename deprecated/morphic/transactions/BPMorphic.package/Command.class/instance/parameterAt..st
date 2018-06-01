parameters
parameterAt: aSymbol 
	"Answer the parameter stored at the given symbol, or nil if none"
	^ self
		parameterAt: aSymbol
		ifAbsent: []