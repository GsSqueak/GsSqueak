menu
chooseJoystickNumber
	"Allow the user to select a joystick number"

	| result aNumber str |
	str := self lastRealJoystickIndex asString.
	result := UIManager default 
				request: ('Joystick device number (currently {1})' translated format: {str})
				initialAnswer: str.
	aNumber := [result asNumber] on: Error do: [:err | ^Beeper beep].
	(aNumber > 0 and: [aNumber <= 32]) 
		ifFalse: 
			["???"

			^Beeper beep].
	realJoystickIndex := aNumber.
	self setProperty: #lastRealJoystickIndex toValue: aNumber.
	self startStepping