accessing
at: aSymbol ifPresent: aBlock

	| value |
	value := self at: aSymbol ifAbsent: [^ nil].
	^ aBlock value: value