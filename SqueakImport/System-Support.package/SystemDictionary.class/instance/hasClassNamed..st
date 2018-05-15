classes and traits
hasClassNamed: aString
	"Answer whether there is a class of the given name, but don't intern aString if it's not alrady interned.  4/29/96 sw"

	Symbol hasInterned: aString ifTrue: 
		[:aSymbol | ^ (self at: aSymbol ifAbsent: [nil]) isKindOf: Class].
	^ false