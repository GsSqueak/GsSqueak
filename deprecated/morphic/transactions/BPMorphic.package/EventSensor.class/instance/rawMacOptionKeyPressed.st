modifier keys
rawMacOptionKeyPressed
	"Answer whether the option key on the Macintosh keyboard is being
	held down. Macintosh specific. Clients are discouraged from calling
	this directly, since it circumvents bert's attempt to eradicate
	option-key checks"
	^ self peekButtons anyMask: 32