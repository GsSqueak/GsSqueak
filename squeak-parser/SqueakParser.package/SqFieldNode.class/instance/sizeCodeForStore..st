code generation
sizeCodeForStore: encoder 
	rcvrNode
		ifNil: [self encodeReceiverOn: encoder].
	fieldDef accessKey
		ifNil: [writeNode
				ifNil: [writeNode := encoder encodeSelector: fieldDef toSet].
			^ (rcvrNode sizeCodeForValue: encoder)
				+ (writeNode
						sizeCode: encoder
						args: 1
						super: false)].
	writeNode
		ifNil: [writeNode := encoder encodeSelector: #set:to:].
	^ (rcvrNode sizeCodeForValue: encoder)
		+ (super sizeCodeForValue: encoder)
		+ (writeNode
				sizeCode: encoder
				args: 2
				super: false)