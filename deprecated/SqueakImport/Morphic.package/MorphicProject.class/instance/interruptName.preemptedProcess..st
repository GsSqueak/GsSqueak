utilities
interruptName: labelString preemptedProcess: theInterruptedProcess
	"Create a Notifier on the active scheduling process with the given label."

	| preemptedProcess projectProcess |
	ActiveHand ifNotNil:[ActiveHand interrupted].
	ActiveWorld := world. "reinstall active globals"
	ActiveHand := world primaryHand.
	ActiveHand interrupted. "make sure this one's interrupted too"
	ActiveEvent := nil.

	projectProcess := self uiProcess.	"we still need the accessor for a while"
	preemptedProcess := theInterruptedProcess ifNil: [Processor preemptedProcess].
	"Only debug preempted process if its priority is >= projectProcess' priority"
	preemptedProcess priority < projectProcess priority 
		ifTrue:[preemptedProcess := projectProcess].
	preemptedProcess suspend.
	ToolSet interrupt: preemptedProcess label: labelString.