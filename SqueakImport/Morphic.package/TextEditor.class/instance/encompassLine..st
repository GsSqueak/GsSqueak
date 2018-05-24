new selection
encompassLine: anInterval
	"Return an interval that encompasses the entire line"
	| string left right |
	string := paragraph text string.
	left := (string lastIndexOfAnyOf: CharacterSet crlf startingAt: anInterval first - 1) + 1.
	right := (string indexOfAnyOf: CharacterSet crlf startingAt: anInterval last + 1 ifAbsent: [string size + 1]) - 1.
	^left to: right