accessing
settingsString

	| s |
	s := WriteStream on: (String new: 1000).
	s nextPutAll: 'player'; cr.
	s tab; nextPutAll: 'rate: ', self rate printString, ';'; cr.
	s tab; nextPutAll: 'overallVolume: ', self overallVolume printString, ';'; cr.
	1 to: self trackCount do: [:t |
		s tab; nextPutAll: 'instrumentForTrack: ', t printString,
			' put: (AbstractSound soundNamed: #default);'; cr.
		s tab; nextPutAll: 'mutedForTrack: ', t printString,
			' put: ', (self mutedForTrack: t) printString, ';'; cr.
		s tab; nextPutAll: 'volumeForTrack: ', t printString,
			' put: ', (self volumeForTrack: t) printString, ';'; cr.
		s tab; nextPutAll: 'panForTrack: ', t printString,
			' put: ', (self panForTrack: t) printString, ';'; cr].
	s tab; nextPutAll: 'repeat: ', self repeat printString, '.'; cr.
	^ s contents
