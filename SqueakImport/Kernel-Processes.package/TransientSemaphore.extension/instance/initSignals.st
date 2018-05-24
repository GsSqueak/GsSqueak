*Kernel-Processes-initialize-release
initSignals
	"Consume any excess signals the receiver may have accumulated."

    self _env0 semaphore _env0 initSignals
