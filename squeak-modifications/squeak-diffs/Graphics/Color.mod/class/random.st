instance creation
random
	"Return a random color that isn't too dark or under-saturated."

	^ self basicNew
		setHue: (360.0 * self randomStream next)
		saturation: (0.3 + (self randomStream next * 0.7))
		brightness: (0.4 + (self randomStream next * 0.6))
