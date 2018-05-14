modifier keys
commandKeyPressed
	"Answer whether the command key on the keyboard is being held down."

	^ self peekButtons anyMask: 64