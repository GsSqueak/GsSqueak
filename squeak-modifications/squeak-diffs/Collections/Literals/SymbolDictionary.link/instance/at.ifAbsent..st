accessing
at: aSymbol ifAbsent: aBlock

	^ self _env0 at: aSymbol asSymbol ifAbsent: aBlock
