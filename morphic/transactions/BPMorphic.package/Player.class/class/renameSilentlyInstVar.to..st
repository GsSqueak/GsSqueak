slots
renameSilentlyInstVar: oldName to: newName 
	(instanceVariables includes: oldName asString)
		ifFalse: [self error: oldName , ' is not defined in ' , self name].
	self removeAccessorsFor: oldName.
	super renameSilentlyInstVar: oldName to: newName.
	self compileAccessorsFor: newName.
	slotInfo
		at: newName asSymbol
		put: (slotInfo at: oldName).
	slotInfo removeKey: oldName