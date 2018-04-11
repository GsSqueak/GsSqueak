joystick
joystickButtons: index 
	^ ((self primReadJoystick: index)
		bitShift: -22)
		bitAnd: 1823