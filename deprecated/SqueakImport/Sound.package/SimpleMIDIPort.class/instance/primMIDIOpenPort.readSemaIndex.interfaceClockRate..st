primitives
primMIDIOpenPort: portNum readSemaIndex: readSemaIndex interfaceClockRate: interfaceClockRate
	"Open the given MIDI port. If non-zero, readSemaIndex specifies the index in the external objects array of a semaphore to be signalled when incoming MIDI data is available. Not all platforms support signalling the read semaphore. InterfaceClockRate specifies the clock rate of the external MIDI interface adaptor on Macintosh computers; it is ignored on other platforms."

	self notYetImplemented.
	self primitiveFailed.
