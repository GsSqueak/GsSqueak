utilities
maybeForkInterrupt

	self flag: #toRemove. "unreferenced in image, check eToys"
	Preferences cmdDotEnabled ifFalse: [^self].
	[self current interruptName: 'User Interrupt'] fork
