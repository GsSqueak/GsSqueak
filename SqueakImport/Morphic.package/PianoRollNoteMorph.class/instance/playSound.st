note playing
playSound
	"This STARTS a single long sound.  It must be stopped by playing another or nil."

	^ self playSound: (self soundOfDuration: 999.0)