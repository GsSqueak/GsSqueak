initialize-release
initialize
	ClockProvider ifNil: [ClockProvider := Time].
	Smalltalk addToStartUpList: self after: Delay.
	self startUp: true.
