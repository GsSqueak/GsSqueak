private
process: aProcess controller: aController context: aContext

	super initialize.
	Smalltalk at: #MessageTally ifPresentAndInMemory: [ :tally |
		tally terminateTimerProcess].
	contents := nil. 
	interruptedProcess := aProcess.
	interruptedController := aController.
	self newStack: (aContext stackOfSize: 1).
	contextStackIndex := 1.
	externalInterrupt := false.
	selectingPC := true.
	Smalltalk isMorphic ifTrue:
		[errorWasInUIProcess := false]