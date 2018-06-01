accessing
panForTrack: i

	| left right fullVol pan |
	left := leftVols at: i.
	right := rightVols at: i.
	left = right ifTrue: [^ 0.5].  "centered"
	fullVol := left max: right.
	left < fullVol
		ifTrue: [pan := left asFloat / (2.0 * fullVol)]
		ifFalse: [pan := 1.0 - (right asFloat / (2.0 * fullVol))].
	^ pan roundTo: 0.001

