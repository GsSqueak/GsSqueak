changing process state
resume
	"Primitive. Allow the process that the receiver represents to continue. Put 
	 the receiver in line to become the activeProcess.  Fail if the receiver is 
	 already waiting in a queue (in a Semaphore or ProcessScheduler).  Fail if
	 the receiver's suspendedContext is not a context.
	 Essential. See Object documentation whatIsAPrimitive."

	<primitive: 87>
	self primitiveFailed