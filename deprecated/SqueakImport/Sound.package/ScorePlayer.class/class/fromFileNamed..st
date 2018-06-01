instance creation
fromFileNamed: fileName

	^ self onScore: (MIDIFileReader scoreFromFileNamed: fileName)