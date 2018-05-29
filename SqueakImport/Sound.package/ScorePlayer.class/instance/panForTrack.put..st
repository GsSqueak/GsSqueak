accessing
panForTrack: trackIndex put: aNumber
	"Set the left-right pan for this track to a value in the range [0.0..1.0], where 0.0 means full-left."

	| fullVol pan left right |
	trackIndex > leftVols size ifTrue: [^ self].
	fullVol := (leftVols at: trackIndex) max: (rightVols at: trackIndex).
	pan := (aNumber asFloat min: 1.0) max: 0.0.
	pan <= 0.5
		ifTrue: [  "attenuate right channel"
			left := fullVol.
			right := 2.0 * pan * fullVol]
		ifFalse: [  "attenuate left channel"
			left := 2.0 * (1.0 - pan) * fullVol.
			right := fullVol].
	rightVols at: trackIndex put: right asInteger.
	leftVols at: trackIndex put: left asInteger.
