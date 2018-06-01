other
supportsDisplayDepth: pixelDepth
	"Return true if this pixel depth is supported on the current host platform."
	Smalltalk platformName = 'Mac OS' ifTrue: [^pixelDepth abs = 32]. "Work around VM bug"
	^self primSupportsDisplayDepth: pixelDepth