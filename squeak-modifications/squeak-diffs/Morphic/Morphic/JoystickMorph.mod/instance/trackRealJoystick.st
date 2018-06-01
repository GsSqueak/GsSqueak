menu
trackRealJoystick

	| s |
	s := UIManager default
		request: 'Number of joystick to track?'
		initialAnswer: '1'.
	s isEmpty ifTrue: [^ self].
	realJoystickIndex := Number readFromString: s.
	self startStepping.
