constructor
codeTemp: index 
	^ SqTempVariableNode new
		name: 't' , (index + 1) printString
		index: index
		type: LdTempType
		scope: 0