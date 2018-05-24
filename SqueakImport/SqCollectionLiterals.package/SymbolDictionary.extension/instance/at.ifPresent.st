*SqCollectionLiterals-accessing
at: aSymbol ifPresent: aBlock

	^ self _env0 at: aSymbol asSymbol ifPresent: aBlock
