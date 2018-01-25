private
flushNonKbdEvents

	self eventQueue ifNotNil: [:queue |
		queue flushAllSuchThat: [:buf | (self isKbdEvent: buf) not]].