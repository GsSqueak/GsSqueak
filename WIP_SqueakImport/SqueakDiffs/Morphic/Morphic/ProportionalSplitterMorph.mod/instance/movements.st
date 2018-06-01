layout
movements
	"Used to track my pattern of movement for the last 3 steps to fix the twitching."
"Lazy-init for now for smooth transition -- want to convert this back to direct-var access after a few months."
	^ movements ifNil: [ self initializeMovements. movements ]