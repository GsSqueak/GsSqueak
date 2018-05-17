*Kernel-Processes-testing
isBlocked
	"A process is blocked if it is waiting on some list (i.e. a Semaphore), other than the runnable process lists."
	| myPriority |
	"Grab my prioirty now.  Even though evaluation is strictly right-to-left, accessing Processor could involve a send."
	myPriority := self priority.
	^myList
		ifNil: [false]
		ifNotNil: [:list| list ~~ (Processor waitingProcessesAt: myPriority)]
