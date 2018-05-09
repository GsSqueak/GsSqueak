primitives
primSignal: aSemaphore atUTCMicroseconds: anInteger
	"Signal the semaphore when the UTC microsecond clock reaches the value of the second argument.
	 Fail if the first argument is neither a Semaphore nor nil, or if the second argument is not an integer.
	 Essential. See Object documentation whatIsAPrimitive."
	<primitive: 242>
	^self primitiveFailed