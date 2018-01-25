*SqProcess
anyProcessesAbove: highestPriority
	"Do any instances of Process exist with higher priorities?"

	^(Process allSubInstances select: [:aProcess | 
		aProcess priority > highestPriority]) isEmpty
		"If anyone ever makes a subclass of Process, be sure to use allSubInstances."
