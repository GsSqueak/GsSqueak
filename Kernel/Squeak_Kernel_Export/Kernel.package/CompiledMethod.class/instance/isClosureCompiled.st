testing
isClosureCompiled
	"Answer whether the receiver was compiled using the closure compiler.
	 This is used to help DebuggerMethodMap choose which mechanisms to
	 use to inspect (debug) activations of the receiver."

	^self encoderClass supportsClosures