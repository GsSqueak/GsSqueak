code generation
sizeCodeForReturn: encoder 
	encoder
		if: code
		isSpecialLiteralForReturn: [:specialLiteral | ^ encoder sizeReturnSpecialLiteral: specialLiteral].
	(self code = LdSelf
			or: [self code = LdSuper])
		ifTrue: [^ encoder sizeReturnReceiver].
	^ super sizeCodeForReturn: encoder