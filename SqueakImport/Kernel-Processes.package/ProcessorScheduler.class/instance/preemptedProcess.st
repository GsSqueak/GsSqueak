accessing
preemptedProcess
	"Return the process that the currently active process just preempted."
	
	self activeProcess priority to: 1 by: -1 do: [:priority |
		(quiescentProcessLists at: priority) ifNotEmpty: [:list |
			^ Smalltalk processPreemptionYields
				ifTrue: [list last]
				ifFalse: [list first]]].
	^ nil
	
	"Processor preemptedProcess"