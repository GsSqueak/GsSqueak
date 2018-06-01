class initialization
cleanUp: agressive
	"Remove all projects but only when cleaning aggressively"

	agressive ifTrue:[
		self removeAllButCurrent.
		self current resourceManager reset].