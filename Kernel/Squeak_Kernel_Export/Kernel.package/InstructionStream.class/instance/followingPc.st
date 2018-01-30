scanning
followingPc
	"Answer the pc of the following bytecode."
	| method |
	method := self method.
	^pc + (method encoderClass bytecodeSize: (method at: pc))