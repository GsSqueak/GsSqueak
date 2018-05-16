sorting
<=> aCharacterArray
	"Return a collation order of -1, 0, or 1, indicating whether I should be collated before the receiver, am equal, or after.
	See also:  http://en.wikipedia.org/wiki/Spaceship_operator"

	aCharacterArray isString ifTrue: [ ^string <=> aCharacterArray ].
	^string <=> aCharacterArray asString