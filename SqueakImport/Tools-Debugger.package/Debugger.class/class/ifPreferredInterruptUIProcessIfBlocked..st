private
ifPreferredInterruptUIProcessIfBlocked: errorWasInUIProcess
	| sema |
	errorWasInUIProcess ifTrue:
		[^self].
	self interruptUIProcessIfBlockedOnErrorInBackgroundProcess ifFalse:
		[^self].
	"Only interrupt the UI if it is unresponsive (and so is doing something that needs
	 interrupting).  Test using addDeferredUIMessage: to see if it is running UI activities."
	sema := Semaphore new.
	Project current addDeferredUIMessage: [sema signal].
	(sema waitTimeoutMSecs: 100) ifTrue:
		[[Project current interruptName: 'Interrupt from Background Error'] fork]

	"| s |
	s := Semaphore new.
	[self assert: 0 > 1000. s signal] fork.
	s wait"