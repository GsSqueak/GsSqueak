testing
testConstMinusOne
	"ConstMinusOne is the object reference for integer -1. It must be handled specially
	in the interpreter simulator because it resolves to a negative integer that cannot be
	directly stored into a BitMap. See InterpreterSimulator>>initialize. Note that an
	interpreter simulator modifies constants that are used in code generation. VMMaker
	is expected to always initialize constants prior to generating code."

	| interp |
	self initializeVMConstants.
	self assert: InterpreterSimulator constMinusOne = -1.
	[self assert: ContextInterpreter constMinusOne = -1.
	interp := InterpreterSimulator new. "modifies the constants in simulation"
	self deny: InterpreterSimulator constMinusOne = -1.
	self deny: ContextInterpreter constMinusOne = -1.
	self assert: ContextInterpreter constMinusOne = 16rFFFFFFFF.
	"	interp bytesPerWord: 8."
	"	interp initialize."
	"Note: Integer value of -1 is the same in 64 bit object memory because
	SmallInteger format is currently the same as in 32 bit object memory."
	self assert: ContextInterpreter constMinusOne = 16rFFFFFFFF]
		ensure: [self initializeVMConstants].
	self assert: InterpreterSimulator constMinusOne = -1.
