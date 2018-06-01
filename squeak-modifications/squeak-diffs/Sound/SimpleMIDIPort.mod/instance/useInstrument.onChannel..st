open/close
useInstrument: aName onChannel: aChannel
	self useInstrumentNumber: (self class midiInstruments indexOf: aName)-1 onChannel: aChannel