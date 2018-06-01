stepping and presenter
stepTime
	"Provide for as-fast-as-possible stepping in the case of a real joystick"

	^ realJoystickIndex
		ifNotNil:
			[0]  "fast as we can to track actual joystick"
		ifNil:
			[super stepTime]