as yet unclassified
scoreFromStream: binaryStream

	|  score |
	score := (self new readMIDIFrom: binaryStream) asScore.
	^ score
