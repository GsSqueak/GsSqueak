simulation
encoderClassForHeader: headerInteger 
	^ Smalltalk
		classNamed: ((headerInteger < 0
					or: [objectMemory headerIndicatesAlternateBytecodeSet: headerInteger])
				ifTrue: [AltBytecodeEncoderClassName]
				ifFalse: [BytecodeEncoderClassName])