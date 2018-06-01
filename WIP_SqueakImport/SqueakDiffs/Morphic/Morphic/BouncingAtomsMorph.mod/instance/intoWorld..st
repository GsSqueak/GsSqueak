initialization
intoWorld: aWorld
	"Make sure report damage at least once"
	damageReported := false.
	super intoWorld: aWorld.