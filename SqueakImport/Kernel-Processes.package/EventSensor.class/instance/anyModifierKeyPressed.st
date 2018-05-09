modifier keys
anyModifierKeyPressed
	"ignore, however, the shift keys 'cause that's not REALLY a command key"

	^ self peekButtons anyMask: 16r70	"cmd | opt | ctrl"