accessing
at: aSymbol ifAbsent: aBlock

	^ self interface environment: self at: aSymbol ifAbsent: aBlock