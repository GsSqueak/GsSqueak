constructor
codeTemp: index named: tempName 
	^ SqTempVariableNode new
		name: tempName
		index: index
		type: LdTempType
		scope: 0