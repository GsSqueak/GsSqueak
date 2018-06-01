code generation
sizeCodeForStorePop: encoder 
	self reserve: encoder.
	^ (key isVariableBinding
			and: [key isSpecialWriteBinding])
		ifTrue: [writeNode := encoder encodeSelector: #value:.
			^ (writeNode
				sizeCode: encoder
				args: 1
				super: false)
				+ encoder sizePop]
		ifFalse: [encoder sizeStorePopLiteralVar: index]