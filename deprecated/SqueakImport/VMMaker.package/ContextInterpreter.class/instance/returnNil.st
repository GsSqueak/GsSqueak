return bytecodes
returnNil
	localReturnContext := self sender.
	localReturnValue := objectMemory getNilObj.
	self commonReturn.