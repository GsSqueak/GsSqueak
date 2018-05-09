initialize-release
initialize
	"This is required for correct initialize order when loaded via Moticello"
	Duration initialize

	ClockProvider ifNil: [ClockProvider := Time].
	Smalltalk addToStartUpList: self after: Delay.
	self startUp: true.
