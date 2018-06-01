menu
toggleRealJoystick
	"Toggle whether or not one is using a real joystick"

	realJoystickIndex
		ifNil:
			[realJoystickIndex := self valueOfProperty: #lastRealJoystickIndex ifAbsentPut: [1].
			self startStepping]
		ifNotNil:
			[self stopTrackingJoystick]