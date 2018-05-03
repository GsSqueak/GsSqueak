instance creation
on: objectMemory
	| interp |
	interp := self == InterpreterSimulator
		ifTrue: [SmalltalkImage current endianness == #big
				ifTrue: [InterpreterSimulatorMSB basicNew]
				ifFalse: [InterpreterSimulatorLSB basicNew]]
		ifFalse: [super basicNew].
	interp objectMemory: objectMemory.
	objectMemory setInterpreter: interp.
	^ interp initialize
