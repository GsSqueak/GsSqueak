instance creation
new
	| objectMemory |
	objectMemory := self == InterpreterSimulator
		ifTrue: [SmalltalkImage current endianness == #big
				ifTrue: [ObjectMemorySimulatorMSB basicNew]
				ifFalse: [ObjectMemorySimulatorLSB basicNew]].
	^ self on: objectMemory
