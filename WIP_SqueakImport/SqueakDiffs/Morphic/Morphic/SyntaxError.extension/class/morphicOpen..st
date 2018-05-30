*Morphic-Support
morphicOpen: aSyntaxError
	"Answer a view whose model is an instance of me."

	self buildMorphicViewOn: aSyntaxError.
	Project current spawnNewProcessIfThisIsUI: Processor activeProcess.
	^ Processor activeProcess suspend