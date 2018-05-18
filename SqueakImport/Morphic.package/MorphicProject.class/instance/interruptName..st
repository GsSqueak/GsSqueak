scheduling
interruptName: labelString
	"Create a Notifier on the active scheduling process with the given label."

	^ self interruptName: labelString preemptedProcess: nil