accessing
at: aSymbol

	^ self at: aSymbol ifAbsent: [self errorKeyNotFound: aSymbol]