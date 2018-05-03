debug support
checkForInterrupts
	"Prevent interrupts so that traces are consistent during detailed debugging"

	true ifTrue: [^ self].
	^ super checkForInterrupts