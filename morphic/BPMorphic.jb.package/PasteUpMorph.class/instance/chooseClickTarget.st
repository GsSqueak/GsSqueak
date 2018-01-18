world state
chooseClickTarget	Cursor crossHair		showWhile: [Sensor waitButton].	Cursor down		showWhile: [Sensor anyButtonPressed].	^ (self morphsAt: Sensor cursorPoint) first