return bytecodes
returnFalse
	localReturnContext := self sender.
	localReturnValue := objectMemory getFalseObj.
	self commonReturn.
