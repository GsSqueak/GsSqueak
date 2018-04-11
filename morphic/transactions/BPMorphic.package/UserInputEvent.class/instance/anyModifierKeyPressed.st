modifier state
anyModifierKeyPressed
	"ignore, however, the shift keys 'cause that's not REALLY a command
	key "
	^ self buttons anyMask: 112"cmd | opt | ctrl"