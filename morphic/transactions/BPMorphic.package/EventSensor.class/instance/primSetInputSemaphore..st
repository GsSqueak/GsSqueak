private-I/O
primSetInputSemaphore: semaIndex 
	"Set the input semaphore the VM should use for asynchronously
	signaling the availability of events. Primitive. Optional."
	self halt.
	^ nil