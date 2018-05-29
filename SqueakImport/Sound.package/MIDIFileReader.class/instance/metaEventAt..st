track reading
metaEventAt: ticks
	"Read a meta event. Event types appear roughly in order of expected frequency."

	| type length tempo |
	type := trackStream next.
	length := self readVarLengthIntFrom: trackStream.

	type = 16r51 ifTrue: [  "tempo"
		tempo := 0.
		length timesRepeat: [tempo := (tempo bitShift: 8) + trackStream next].
		track add: (TempoEvent new tempo: tempo; time: ticks).
		^ self].

	type = 16r2F ifTrue: [  "end of track"
		length = 0 ifFalse: [self error: 'length of end-of-track chunk should be zero'].
		self endAllNotesAt: ticks.
		trackStream skip: length.
		^ self].

	type = 16r58 ifTrue: [  "time signature"
		length = 4 ifFalse: [self error: 'length of time signature chunk should be four'].
		trackStream skip: length.
		^ self].

	type = 16r59 ifTrue: [  "key signature"
		length = 2 ifFalse: [self error: 'length of key signature chunk should be two'].
		trackStream skip: length.
		^ self].

	((type >= 1) and: [type <= 7]) ifTrue: [  "string"
		strings add: (trackStream next: length) asString.
		^ self].

	(  type = 16r21 or:   "mystery; found in MIDI files but not in MIDI File 1.0 Spec"
	 [(type = 16r7F) or:  "sequencer specific meta event"
	 [(type = 16r00) or:  "sequence number"
	 [(type = 16r20)]]])  "MIDI channel prefix"
		ifTrue: [
			trackStream skip: length.
			^ self].

	type = 16r54 ifTrue: [
		"SMPTE offset"
		self report: 'Ignoring SMPTE offset'.
		trackStream skip: length.
		^ self].

	"skip unrecognized meta event"
	self report:
		'skipping unrecognized meta event: ', (type printStringBase: 16),
		' (', length printString, ' bytes)'.
	trackStream skip: length.
