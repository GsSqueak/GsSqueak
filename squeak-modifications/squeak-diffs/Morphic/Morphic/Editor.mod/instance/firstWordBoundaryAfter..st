private
firstWordBoundaryAfter: position
	"If the character at position is whitespace, answer the position of the first character after position which is not whitespace.
	If the character at position is not whitespace, answer the position of the first character after position which is whitespace."
	| string index atWhitespace |
	string := self string.
	index := position.
	(atWhitespace := (string at: index) isSeparator)
		ifTrue:
			[ "find next non-separator"
			[ (index <= string size) and: [ (string at: index) isSeparator ] ] whileTrue: [ index := index + 1 ] ]
		ifFalse:
			[ "find next separator"
			[ (index <= string size) and: [ (string at: index) isSeparator not ] ] whileTrue: [ index := index + 1 ] ].
	^ index