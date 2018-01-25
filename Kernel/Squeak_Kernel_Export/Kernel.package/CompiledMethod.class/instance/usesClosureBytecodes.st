testing
usesClosureBytecodes
	"Answer whether the receiver was compiled using the closure compiler.
	 This is used to help DebuggerMethodMap choose which mechanisms to
	 use to inspect activations of the receiver.
	 This method answers false negatives in that it only identifies methods
	 that use the new BlockClosure bytecodes.
	 But since methods that don't create blocks have essentially the same
	 code when compiled with either compiler this makes little difference."

	^self encoderClass supportsClosures