constructor
codeAnyLitInd: association 
	^ SqVariableNode new
		name: association key
		key: association
		index: 0
		type: LdLitIndType