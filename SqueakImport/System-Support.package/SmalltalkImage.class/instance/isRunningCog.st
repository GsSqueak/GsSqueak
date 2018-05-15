system attributes
isRunningCog
	"Answers if we're running on a Cog VM (JIT or StackInterpreter)"

	^(self vmParameterAt: 42)
		ifNil: [false]
		ifNotNil: [:numStackPages| numStackPages > 0]