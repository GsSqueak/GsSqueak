opcode sizing
sizePushTempLong: tempIndex 
	^ self sizeOpcodeSelector: #genPushTempLong: withArguments: {tempIndex}