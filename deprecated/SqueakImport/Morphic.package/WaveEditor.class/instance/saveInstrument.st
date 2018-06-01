menu
saveInstrument

	| name |
	name := UIManager default request: 'Instrument name?' translated.
	name isEmpty ifTrue: [^ self].
	AbstractSound soundNamed: name put: self makeLoopedSampledSound.
