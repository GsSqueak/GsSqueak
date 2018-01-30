name
unusedMorphNameLike: stem 
	"Answer a suitable name for a morph in this world, based on the stem
	provided "
	| names |
	names := self allKnownNames.
	^ Utilities
		keyLike: stem asString
		satisfying: [:aName | (names includes: aName) not]