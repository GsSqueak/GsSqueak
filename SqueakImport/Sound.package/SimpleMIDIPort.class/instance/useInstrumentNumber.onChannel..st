open/close
useInstrumentNumber: aNumber onChannel: aChannel
	self ensureOpen.
	self midiCmd: 192 channel: aChannel byte: aNumber 