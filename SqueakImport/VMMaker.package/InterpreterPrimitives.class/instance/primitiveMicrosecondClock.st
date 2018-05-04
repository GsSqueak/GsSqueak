system control primitives
primitiveMicrosecondClock
	"This is a named (not numbered) primitive in the null module (ie the VM)"
	<export: true>
	self pop: 1 thenPush: (self positive64BitIntegerFor: (self ioMicroSecondClock)).
