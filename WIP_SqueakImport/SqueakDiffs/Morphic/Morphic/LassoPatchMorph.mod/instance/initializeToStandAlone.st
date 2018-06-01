initialization
initializeToStandAlone
	"Initialize the receiver such that it can live on its own.  Sets its image to the lasso picture"

	super initializeToStandAlone.
	self image: (ScriptingSystem formAtKey: 'Lasso')