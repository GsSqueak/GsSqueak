menu
realJoystickString
	"Answer a string characterizing whether or not I am currenty tracking a real joystick"

	^ (realJoystickIndex ifNil: ['<no>'] ifNotNil: ['<yes>']), ('track real joystick' translated)