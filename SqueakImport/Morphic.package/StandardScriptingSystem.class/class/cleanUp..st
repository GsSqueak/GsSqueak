class initialization
cleanUp: agressive
	"Clean up unreferenced players. If agressive, reinitialize and nuke players"

	self removeUnreferencedPlayers.
	agressive ifTrue:[
		References keys do: [:k | References removeKey: k].
		self initialize.
	].