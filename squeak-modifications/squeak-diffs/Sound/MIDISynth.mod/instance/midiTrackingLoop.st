as yet unclassified
midiTrackingLoop

	midiParser clearBuffers.
	
	[self processMIDI ifFalse: [(Delay forMilliseconds: 5) wait]] repeat