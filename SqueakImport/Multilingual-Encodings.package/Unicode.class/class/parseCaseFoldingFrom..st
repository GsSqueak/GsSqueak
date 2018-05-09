casing
parseCaseFoldingFrom: caseFoldingData
	"Parse the Unicode casing mappings from the given string."

	| newToCasefold |
	newToCasefold := PluggableDictionary integerDictionary.

	"Filter the mappings (Simple and Common) to newToCasefold."
	caseFoldingData linesDo: [ :line |
		| lineWithoutComment fields sourceCode destinationCode |
		lineWithoutComment := line copyUpTo: $#.
		fields := lineWithoutComment findTokens: '; '.
		(fields size > 2 and: [ #('C' 'S') includes: (fields at: 2) ]) ifTrue: [
			sourceCode := Integer readFrom: (fields at: 1) base: 16.
			destinationCode := Integer readFrom: (fields at: 3) base: 16.
			newToCasefold at: sourceCode put: destinationCode ] ].

	"Compact and save."
	ToCasefold := newToCasefold compact
	