finalization
fireFinalization: weakling 
	newFinalization
		ifTrue: [objectMemory queueMourner: weakling].
	self signalFinalization: weakling