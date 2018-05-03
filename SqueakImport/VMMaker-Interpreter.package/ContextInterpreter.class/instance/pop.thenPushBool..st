contexts
pop: nItems thenPushBool: trueOrFalse
	"A few places pop a few items off the stack and then push a boolean. Make it convenient"
	| sp |
	objectMemory longAt: (sp := stackPointer - ((nItems - 1) * objectMemory bytesPerWord))
		put:(trueOrFalse ifTrue: [objectMemory getTrueObj] ifFalse: [objectMemory getFalseObj]).
	stackPointer := sp