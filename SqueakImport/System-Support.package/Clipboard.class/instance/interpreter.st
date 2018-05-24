accessing
interpreter

	interpreter ifNil: [self setInterpreter].
	^ interpreter.
