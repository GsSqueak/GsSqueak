events
stepTime
	"When a splitter finds itself in the right place, let it rest for about 3 seconds to avoid performance impacts of constant, rapid stepping."
	| pause |
	pause := 3000. "Frozen image when atRandom failed due to lock on its Mutex."
	^ ({#(1 -1 1 ).  #(-1 1 -1 )} includes: self movements asArray)
		ifTrue: [ pause "don't twitch" ]
		ifFalse:
			[ splitsTopAndBottom
				ifTrue:
					[ self topBottomCorrection isZero
						ifTrue: [ pause ]
						ifFalse: [ 0 ] ]
				ifFalse:
					[ self leftRightImbalance abs > 1
						ifTrue: [ ">1 rather than 0 to discourage one-off twitching"
							0 ]
						ifFalse: [ pause ] ] ]