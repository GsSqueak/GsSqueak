constructor
codeAnyLiteral: value 
	^ SqLiteralNode new
		key: value
		index: 0
		type: LdLitType