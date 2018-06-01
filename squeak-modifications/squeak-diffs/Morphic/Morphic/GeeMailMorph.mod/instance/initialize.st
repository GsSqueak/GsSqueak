initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	self initializeThePasteUp.
	self position: 100@100.
	self extent: Display extent // 3.
	self useRoundedCorners.
	