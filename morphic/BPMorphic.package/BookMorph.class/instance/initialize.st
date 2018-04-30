initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	self setInitialState.
	pages := OrderedCollection new.
	self showPageControls.
	self class
		turnOffSoundWhile: [self insertPage]