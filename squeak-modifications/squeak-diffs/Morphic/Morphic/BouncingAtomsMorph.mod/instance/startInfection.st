menu
startInfection

	self submorphsDo: [:m | m infected: false].
	self firstSubmorph infected: true.
	infectionHistory := OrderedCollection new: 500.
	transmitInfection := true.
	self startStepping.
