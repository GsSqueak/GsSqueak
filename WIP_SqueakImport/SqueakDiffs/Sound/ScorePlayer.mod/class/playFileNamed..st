instance creation
playFileNamed: fileName

	^ (MIDISound fromFileNamed: fileName)
		play; yourself