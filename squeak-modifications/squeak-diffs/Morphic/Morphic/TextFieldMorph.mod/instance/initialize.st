initialization
initialize
	"initialize the state of the receiver"
	| tm |
	super initialize.
	""
	
	self addMorph: (tm := TextMorph new).
	tm fillingOnOff