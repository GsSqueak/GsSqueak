private
display
	| _gsSqueakTemp_f _gsSqueakTemp_ramp |
	_gsSqueakTemp_ramp := self pixelRamp.
	_gsSqueakTemp_f := Form
				extent: _gsSqueakTemp_ramp size @ 1
				depth: 32
				bits: _gsSqueakTemp_ramp.
	1
		to: 100
		do: [:i | _gsSqueakTemp_f displayAt: 1 @ i].
	[Sensor anyButtonPressed] whileFalse.
	[Sensor anyButtonPressed] whileTrue