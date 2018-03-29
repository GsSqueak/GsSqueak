initialization
initializeBytecodeTable
	"StackInterpreter initializeBytecodeTable"
	VMBytecodeConstants falsifyBytecodeSetFlags: initializationOptions.
	BytecodeSetHasDirectedSuperSend := false.
	(initializationOptions at: #bytecodeTableInitializer ifAbsent: nil)
		ifNotNil: [:initalizer | ^ self perform: initalizer].
	NewspeakVM
		ifTrue: [^ MULTIPLEBYTECODESETS
				ifTrue: [self initializeBytecodeTableForSqueakV3PlusClosuresNewspeakV4Hybrid]
				ifFalse: [self initializeBytecodeTableForNewspeakV4]].
	^ MULTIPLEBYTECODESETS
		ifTrue: [self initializeBytecodeTableForSqueakV3PlusClosuresSistaV1Hybrid]
		ifFalse: [self initializeBytecodeTableForSqueakV3PlusClosures]