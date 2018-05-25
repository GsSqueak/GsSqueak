system attributes
isRunningCogit
	"Answers if we're running on the Cog JIT"

	^(self vmParameterAt: 46)
		ifNil: [false]
		ifNotNil: [:machineCodeZoneSize| machineCodeZoneSize > 0]
