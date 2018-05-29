initialization
initializeToStandAlone
	"Initialize the receiver.  Emblazon the GrabPatch icon on its face"

	super initializeToStandAlone.
	self image: (ScriptingSystem formAtKey: 'GrabPatch')