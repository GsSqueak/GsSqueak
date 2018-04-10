user interrupts
userInterruptWatcher
	"Wait for user interrupts and open a notifier on the active process
	when one occurs."
	[InterruptSemaphore wait.
	Display deferUpdates: false.
	SoundService stop.
	Smalltalk handleUserInterrupt] repeat