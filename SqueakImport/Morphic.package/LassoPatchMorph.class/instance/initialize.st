initialization
initialize
	"Initialize the receiver.  Sets its image to the lasso picture"

	super initialize.
	self image: (ScriptingSystem formAtKey: 'Lasso')