note controls
fullDuration

	| num denom |
	num := denom := 1.
	durationModifier == #dotted ifTrue: [num := 3.  denom := 2].
	durationModifier == #triplets ifTrue: [num := 2.  denom := 3].
	durationModifier == #quints ifTrue: [num := 2.  denom := 5].
	^ pianoRoll score ticksPerQuarterNote * 4 * num // duration // denom