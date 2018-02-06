joystick
joystickXY: index 
	| _gsSqueakTemp_inputWord _gsSqueakTemp_x _gsSqueakTemp_y |
	_gsSqueakTemp_inputWord := self primReadJoystick: index.
	_gsSqueakTemp_x := (_gsSqueakTemp_inputWord bitAnd: 2047)
				- 1024.
	_gsSqueakTemp_y := ((_gsSqueakTemp_inputWord bitShift: -11)
				bitAnd: 2047)
				- 1024.
	^ _gsSqueakTemp_x @ _gsSqueakTemp_y