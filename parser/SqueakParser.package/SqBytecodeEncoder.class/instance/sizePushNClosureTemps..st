opcode sizing
sizePushNClosureTemps: numTemps 
	^ self sizeOpcodeSelector: #genPushNClosureTemps: withArguments: {numTemps}