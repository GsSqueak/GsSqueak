initialize
initialize
	"Initialize the receiver"
	mouseButtons := 0.
	mousePosition := 0 @ 0.
	mouseWheelDelta := 0 @ 0.
	keyboardBuffer := SharedQueue new.
	self setInterruptKey: (interruptKey ifNil: [$. asciiValue bitOr: 16r0800 ]). 	"cmd-."
	interruptSemaphore := (Smalltalk specialObjectsArray at: 31) ifNil: [Semaphore new].
	self flushAllButDandDEvents.
	inputSemaphore := Semaphore new.
	hasInputSemaphore := false.