as yet unclassified
scoreFromFileNamed: fileName

	| f score |
	f := (FileStream readOnlyFileNamed: fileName) binary.
	score := (self new readMIDIFrom: f) asScore.
	f close.
	^ score
