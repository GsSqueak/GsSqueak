constructor
codeInst: index 
	^ SqInstanceVariableNode new
		name: (instVars
				at: index + 1
				ifAbsent: ['unknown' , index asString])
		index: index + 1