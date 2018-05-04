private
display
	| f ramp |
	ramp := self pixelRamp.
	f := Form extent: ramp size @ 1 depth: 32 bits: ramp.
	1 to: 100 do:[:i| f displayAt: 1@i].
	[Sensor anyButtonPressed] whileFalse.
	[Sensor anyButtonPressed] whileTrue.