mouse
anyButtonPressed
	"Answer whether at least one mouse button is currently being pressed."
	^ self peekButtons anyMask: 7