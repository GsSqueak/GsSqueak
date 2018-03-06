code generation
sizeCodeForValue: encoder 
	rcvrNode
		ifNil: [self encodeReceiverOn: encoder].
	fieldDef accessKey
		ifNil: [readNode
				ifNil: [readNode := encoder encodeSelector: fieldDef toGet].
			^ (rcvrNode sizeCodeForValue: encoder)
				+ (readNode
						sizeCode: encoder
						args: 0
						super: false)].
	readNode
		ifNil: [readNode := encoder encodeSelector: #get:].
	^ (rcvrNode sizeCodeForValue: encoder)
		+ (super sizeCodeForValue: encoder)
		+ (readNode
				sizeCode: encoder
				args: 1
				super: false)