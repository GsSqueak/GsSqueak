package list
packageList
	"Answer a list of the packages in the current system organization."

	| str stream |
	str := Set new: 100.
	stream := WriteStream on: (Array new: 100).
	systemOrganizer categories do:
		[ :categ | | cats | 
		cats := categ asString copyUpTo: $-.
		(str includes: cats) ifFalse: 
			[str add: cats.
			stream nextPut: cats]].
	^stream contents