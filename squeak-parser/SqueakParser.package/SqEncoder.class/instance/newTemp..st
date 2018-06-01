temps
newTemp: name 
	nTemps := nTemps + 1.
	^ SqTempVariableNode new
		name: name
		index: nTemps - 1
		type: LdTempType
		scope: 0