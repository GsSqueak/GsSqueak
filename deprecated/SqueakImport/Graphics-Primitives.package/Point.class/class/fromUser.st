instance creation
fromUser
	Sensor waitNoButton.
	Cursor crossHair show.
	Sensor waitButton.
	Cursor normal show.
	^ Sensor cursorPoint

"Point fromUser"