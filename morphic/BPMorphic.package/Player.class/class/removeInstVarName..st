slots
removeInstVarName: aName 
	self removeInstVarAccessorsFor: aName.
	super removeInstVarName: aName.
	self slotInfo
		removeKey: aName asSymbol
		ifAbsent: []