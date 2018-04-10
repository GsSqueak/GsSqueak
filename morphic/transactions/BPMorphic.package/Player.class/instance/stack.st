misc
stack
	"Answer the stack to which the receiver belongs. This only searches via
	the costume's parent pointer, so there is no guarantee that the stack
	that is found actually contains the receiver in its card list"
	^ costume
		ifNotNil: [costume stack]