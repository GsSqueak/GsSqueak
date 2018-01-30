private
findAnyDisplayDepth
	"Return any display depth that is supported on this system."
	^ self
		findAnyDisplayDepthIfNone: ["Ugh .... now this is a biggie - a system that does not support
			any of the Squeak display depths at all."
			Smalltalk logSqueakError: 'Fatal error: This system has no support for any display depth at all.' inContext: thisContext.
			Smalltalk quitPrimitive]