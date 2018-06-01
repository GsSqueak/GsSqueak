menu
joystickNumberString
	"Answer a string characterizing the joystick number"

	^ 'set real joystick number (now {1})' translated format: {self lastRealJoystickIndex asString}.
