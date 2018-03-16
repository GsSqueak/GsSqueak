new api - environments
environment: environmentProxy bindingOf: aSymbol ifAbsent: aBlock

	^ aSymbol -> (self environment: environmentProxy at: aSymbol ifAbsent: [^ nil])