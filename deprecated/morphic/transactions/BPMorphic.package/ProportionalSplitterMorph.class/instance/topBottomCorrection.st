layout
topBottomCorrection
	^ self top < self topBoundary
		ifTrue: [self topBoundary - self top]
		ifFalse: [self bottom > self bottomBoundary
				ifTrue: [self bottomBoundary - self bottom]
				ifFalse: [| wsAbove wsBelow |
					wsAbove := self canEncroachWhiteSpaceOf: leftOrTop.
					wsBelow := self canEncroachWhiteSpaceOf: rightOrBottom.
					wsAbove
						ifTrue: [wsBelow
								ifTrue: [self splitterBelow
										ifNil: [0]
										ifNotNil: [:below | below reduceTopBottomImbalance min: 0]]
								ifFalse: [self top > self topBoundary
										ifTrue: [-2]
										ifFalse: [0]]]
						ifFalse: [wsBelow
								ifTrue: [self bottom < self bottomBoundary
										ifTrue: [2]
										ifFalse: [0]]
								ifFalse: [self splitterBelow
										ifNil: [0]
										ifNotNil: [:below | below reduceTopBottomImbalance max: 0]]]]]