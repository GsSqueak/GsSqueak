initialization
initialize
	"Initialize the receiver.  Emblazon the GrabPatch icon on its face"

	super initialize.
	self image: (ScriptingSystem formAtKey: 'GrabPatch').
	self setProperty: #ignorePartsBinDrop toValue: true