note controls
noteDuration

	articulation == #staccato ifTrue: [^ (self fullDuration * 0.65) asInteger].
	articulation == #normal ifTrue: [^ (self fullDuration * 0.8) asInteger].
	articulation == #legato ifTrue: [^ (self fullDuration * 0.95) asInteger].
