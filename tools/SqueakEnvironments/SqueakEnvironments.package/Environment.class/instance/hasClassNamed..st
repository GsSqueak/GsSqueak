classes and traits
hasClassNamed: aString 
	Symbol
		hasInterned: aString
		ifTrue: [:symbol | ^ (declarations
				at: symbol
				ifAbsent: [])
				isKindOf: Class].
	^ false