menu
lastRealJoystickIndex
	"Answer the last remembered real joystick index.  Initialize it to 1 if need be"

	^ self valueOfProperty: #lastRealJoystickIndex ifAbsentPut: [1] 