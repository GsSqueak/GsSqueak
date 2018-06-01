private
argumentsWith: aColor
	"Return an argument array appropriate to this action selector"

	| nArgs |
	nArgs := selector ifNil:[0] ifNotNil:[selector numArgs].
	nArgs = 0 ifTrue:[^#()].
	nArgs = 1 ifTrue:[^ {aColor}].
	nArgs = 2 ifTrue:[^ {aColor. sourceHand}].
	nArgs = 3 ifTrue:[^ {aColor. argument. sourceHand}].
