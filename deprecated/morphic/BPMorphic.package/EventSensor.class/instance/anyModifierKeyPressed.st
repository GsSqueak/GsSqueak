modifier keys
anyModifierKeyPressed
	"ignore, however, the shift keys 'cause that's not REALLY a command
	key "
	^ self peekButtons anyMask: 112"cmd | opt | ctrl"