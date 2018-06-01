initialization
initialize
	super initialize.
	prevMouseDown := false.
	showAllEnvelopes := true.
	soundName ifNil: [soundName := 'test'].
	self editSound: (sound ifNil: [FMSound brass1 copy]).
	sound duration: 0.25.
	denominator := 7.
	self extent: 10@10.  "ie the minimum"
