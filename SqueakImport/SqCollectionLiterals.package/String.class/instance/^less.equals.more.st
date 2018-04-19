*SqCollectionLiterals-*SqCollectionLiterals-sorting
<=> aCharacterArray
	"Return a collation order of -1, 0, or 1, indicating whether I should be collated before the receiver, am equal, or after.
	See also:  http://en.wikipedia.org/wiki/Spaceship_operator"

	aCharacterArray isString ifTrue: [ ^(self compare: aCharacterArray) - 2 ].
	self = aCharacterArray 	ifTrue: [ ^0 ].
	self < aCharacterArray 	ifTrue: [ ^-1 ].
	^1
