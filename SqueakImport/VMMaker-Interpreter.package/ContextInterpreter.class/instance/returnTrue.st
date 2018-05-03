return bytecodes
returnTrue
	localReturnContext := self sender.
	localReturnValue := objectMemory getTrueObj.
	self commonReturn.