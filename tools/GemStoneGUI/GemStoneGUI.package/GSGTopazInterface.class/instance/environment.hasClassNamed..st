new api - environments
environment: environmentProxy hasClassNamed: aString

	self environment: environmentProxy at: aString asSymbol ifAbsent: [^ false].
	^ true