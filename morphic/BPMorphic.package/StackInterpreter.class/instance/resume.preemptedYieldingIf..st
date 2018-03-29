process primitive support
resume: aProcess preemptedYieldingIf: yieldImplicitly 
	"Make aProcess runnable and if its priority is higher than that of the
	current process, preempt the current process. Answer if the current
	process was preempted. If the current process was preempted then if
	yieldImplicitly add the current process to the back of its run queue,
	causing an implicit yiled to other processes on the run queue,
	otherwise add the current process to the front of its run queue, hence
	not yielding.
	Blue book behaviour is to yield implicitly but is arguably incorrect."
	| _gsSqueakTemp_activeProc _gsSqueakTemp_activePriority _gsSqueakTemp_newPriority |
	_gsSqueakTemp_activeProc := self activeProcess.
	_gsSqueakTemp_activePriority := self quickFetchInteger: PriorityIndex ofObject: _gsSqueakTemp_activeProc.
	_gsSqueakTemp_newPriority := self quickFetchInteger: PriorityIndex ofObject: aProcess.
	_gsSqueakTemp_newPriority <= _gsSqueakTemp_activePriority
		ifTrue: [self putToSleep: aProcess yieldingIf: true.
			^ false].
	self putToSleep: _gsSqueakTemp_activeProc yieldingIf: yieldImplicitly.
	self transferTo: aProcess.
	^ true