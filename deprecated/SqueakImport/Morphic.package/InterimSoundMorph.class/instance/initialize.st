initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	
	self extent: 30 @ 30.
	self addGraphic.
	sound := PluckedSound
				pitch: 880.0
				dur: 2.0
				loudness: 0.5