initialize
initialize
  "Initialize the receiver"

  mouseButtons := 0.
  mousePosition := 0 @ 0.
  mouseWheelDelta := 0 @ 0.
  keyboardBuffer := TransientSharedQueue new.
  self setInterruptKey: (interruptKey ifNil: [ $. asciiValue bitOr: 2048 ]).	"cmd-."
  interruptSemaphore := nil ifNil: [ TransientSemaphore new ].
  self flushAllButDandDEvents.
  inputSemaphore := TransientSemaphore new.
  hasInputSemaphore := false