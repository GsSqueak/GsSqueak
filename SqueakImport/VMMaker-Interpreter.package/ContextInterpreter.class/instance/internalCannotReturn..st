return bytecodes
internalCannotReturn: resultObj
	<inline: true>
	reclaimableContextCount := 0.
	self internalPush: activeContext.
	self internalPush: resultObj.
	messageSelector := objectMemory splObj: SelectorCannotReturn.
	argumentCount := 1.
	^ self normalSend