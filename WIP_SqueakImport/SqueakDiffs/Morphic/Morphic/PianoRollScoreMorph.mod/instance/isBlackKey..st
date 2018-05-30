drawing
isBlackKey: midiKey
	"Answer true if the given MIDI key corresponds to a black key on the piano keyboard."

	| note |
	note := midiKey \\ 12.
	note = 1 ifTrue: [^ true].
	note = 3 ifTrue: [^ true].
	note = 6 ifTrue: [^ true].
	note = 8 ifTrue: [^ true].
	note = 10 ifTrue: [^ true].
	^ false
