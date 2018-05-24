layout
leftRightImbalance
	"First check if I find myself out of range due to user having reduced size of parent."
	^ self left < self leftBoundary "too far left"
		ifTrue: [ self leftBoundary-self left ]
		ifFalse:
			[ self right > self rightBoundary "too far right"
				ifTrue: [ self rightBoundary-self right ]
				ifFalse: [ self occlusionDifference ] ]