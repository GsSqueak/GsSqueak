private
nextWord: position 
	| string index boundaryCharacters |
	string := self string.
	index := position - 1.
	[ (index
		between: 1
		and: string size) and: [ (string at: index) isSeparator ] ] whileTrue: [ index := index + 1 ].
	boundaryCharacters := ')]}''"|^. 	'.
	((index
		between: 1
		and: string size) and: [ boundaryCharacters includes: (string at: index) ])
		ifTrue:
			[  index := index + 1  ]
		ifFalse:
			[ [ (index
				between: 1
				and: string size) and: [ (boundaryCharacters includes: (string at: index)) not ] ] whileTrue: [ index := index + 1 ] ].
	^ index