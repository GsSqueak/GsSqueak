initialization
initialize
	"initialize the state of the receiver"

	| f |
	super initialize.
	flipOnClick := false.
	
	f := Form extent: 160@120 depth: Display depth.
	f fill: f boundingBox fillColor: color.
	self form: f