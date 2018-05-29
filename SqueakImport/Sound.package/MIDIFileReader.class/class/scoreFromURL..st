as yet unclassified
scoreFromURL: urlString

	| data |
	data := HTTPSocket httpGet: urlString accept: 'audio/midi'.
	data binary.
	^ (self new readMIDIFrom: data) asScore.
