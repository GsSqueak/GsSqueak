scanning
abstractBytecodeMessagesDo: t1 
	self
		abstractBytecodeMessagesFrom: self initialPC
		to: self endPC
		do: t1