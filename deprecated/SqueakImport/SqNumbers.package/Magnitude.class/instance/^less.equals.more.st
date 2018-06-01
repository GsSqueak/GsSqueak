sorting
<=> anotherObject
	"Return a collation order of -1, 0, or 1, indicating whether I should be collated before the receiver, am equal, or after.
	See also:  http://en.wikipedia.org/wiki/Spaceship_operator"

	self = anotherObject ifTrue: [ ^0 ].
	self < anotherObject ifTrue: [ ^-1 ].
	^1