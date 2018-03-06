opcode sizing
sizeSendSpecial: specialSelectorIndex numArgs: nArgs 
	^ self sizeOpcodeSelector: #genSendSpecial:numArgs: withArguments: {specialSelectorIndex. nArgs}