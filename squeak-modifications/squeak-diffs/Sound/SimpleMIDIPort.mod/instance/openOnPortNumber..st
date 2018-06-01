open/close
openOnPortNumber: portNum
	"Open this MIDI port on the given port number."

	self close.
	portNumber := portNum.
	accessSema := Semaphore forMutualExclusion.
	self ensureOpen.
