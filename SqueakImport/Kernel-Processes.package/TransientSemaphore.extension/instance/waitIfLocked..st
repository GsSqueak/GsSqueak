*Kernel-Processes-communication
waitIfLocked: aBlock
	"Use a signal if available, otherwise evaluate aBlock"

	^ self _env0 semaphore _env0 waitIfLocked: aBlock
