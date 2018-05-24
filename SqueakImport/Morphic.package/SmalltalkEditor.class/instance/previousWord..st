private
previousWord: position 
	| string index boundaryCharacters |
	string := self string.
	index := position.
	"First, get out of whitespace."
	[ (index
		between: 2
		and: string size) and: [ (string at: index) isSeparator ] ] whileTrue: [ index := index - 1 ].
	boundaryCharacters := '([{''"|^. 	'.
	"Are we at a boundary character?"
	((index
		between: 2
		and: string size) and: [ boundaryCharacters includes: (string at: index) ])
		ifTrue:
			[ "yes, select it and any following whitespace of this line."
			index := index - 1 ]
		ifFalse:
			[ "no, select to the next boundary character"
			[ (index
				between: 1
				and: string size) and: [ (boundaryCharacters includes: (string at: index)) not ] ] whileTrue: [ index := index - 1 ] ].
	^ index + 1