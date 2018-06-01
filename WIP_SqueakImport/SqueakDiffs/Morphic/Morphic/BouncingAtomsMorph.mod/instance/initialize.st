initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	damageReported := false.
	self extent: 400 @ 250.

	infectionHistory := OrderedCollection new.
	transmitInfection := false.
	self addAtoms: 30