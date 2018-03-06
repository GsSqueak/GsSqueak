opcode sizing
sizeSendDirectedSuper: selectorLiteralIndex numArgs: numArgs 
	^ self sizeOpcodeSelector: #genSendDirectedSuper:numArgs: withArguments: {selectorLiteralIndex. numArgs}