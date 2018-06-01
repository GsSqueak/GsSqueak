code generation
sizeCodeForValue: encoder 
	self reserve: encoder.
	(key isVariableBinding
			and: [key isSpecialReadBinding])
		ifFalse: [^ encoder sizePushLiteralVar: index].
	readNode := SqMessageNode new
				receiver: (encoder encodeLiteral: key)
				selector: (encoder encodeSelector: #value)
				arguments: #()
				precedence: #value precedence.
	^ readNode sizeCodeForValue: encoder