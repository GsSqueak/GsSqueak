image segment in/out
primitiveFailAfterCleanup: outPointerArray
	"If the storeSegment primitive fails, it must clean up first."

	| i lastAddr |   "Store nils throughout the outPointer array."
	lastAddr := outPointerArray + (objectMemory lastPointerOf: outPointerArray).
	i := outPointerArray + objectMemory baseHeaderSize.
	[i <= lastAddr] whileTrue:
		[objectMemory longAt: i put: objectMemory getNilObj.
		i := i + objectMemory bytesPerWord].

	DoAssertionChecks ifTrue: [objectMemory verifyCleanHeaders].
	self primitiveFail