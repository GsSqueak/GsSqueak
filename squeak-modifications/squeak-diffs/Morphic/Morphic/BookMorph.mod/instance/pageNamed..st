accessing
pageNamed: aName
	^ pages detect: [:p | p knownName = aName] ifNone: [nil]