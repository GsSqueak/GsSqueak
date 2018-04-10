class initialization
initialize
	"CornerGripMorph initialize"
	super initialize.
	self initializeActiveForm.
	self initializePassiveForm.
	self activeColor: Color orange