return bytecodes
internalMustBeBoolean
	messageSelector := objectMemory splObj: SelectorMustBeBoolean.
	argumentCount := 0.
	self normalSend