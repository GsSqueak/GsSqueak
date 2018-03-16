accessing
at: aSymbol ifAbsent: aBlock

	^ GSGClassProxy interface: self interface named: aSymbol inEnvironment: self
	"^ self interface environment: self at: aSymbol ifAbsent: aBlock."