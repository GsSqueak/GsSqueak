private
flushNonKbdEvents
	"We do NOT use 'isKeybdEvent: ' here,
	 as that would have us flush key press-release events,
	 which is not appropriate when flushing non-keyboard events."
	self eventQueue ifNotNil:
		[:queue |
		 queue flushAllSuchThat: [:buf | (self isAnyKbdEvent: buf) not]]