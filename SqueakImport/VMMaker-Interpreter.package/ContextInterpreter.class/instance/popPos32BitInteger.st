contexts
popPos32BitInteger
	"May set primFailCode, and return false if not valid"

	| top |
	top := self popStack.
	^ self positive32BitValueOf: top