code generation
sizeCodeForStore: encoder 
	self reserve: encoder.
	(key isVariableBinding
			and: [key isSpecialWriteBinding])
		ifFalse: [^ encoder sizeStoreLiteralVar: index].
	writeNode := encoder encodeSelector: #value:.
	"On entry the stack has only the expression. Push the binding,
	duplicate the expression, send #value: and pop."
	^ (encoder sizePushLiteral: index)
		+ (encoder sizePushTempLong: 0)
		+ (writeNode
				sizeCode: encoder
				args: 1
				super: false) + encoder sizePop"we don't know yet, hence long, sigh..."