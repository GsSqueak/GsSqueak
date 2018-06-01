layout
leftRightImbalance
	"First check if I find myself out of range due to user having reduced
	size of parent."
	^ self left < self leftBoundary
		ifTrue: ["too far left"
			self leftBoundary - self left]
		ifFalse: [self right > self rightBoundary
				ifTrue: ["too far right"
					self rightBoundary - self right]
				ifFalse: [self occlusionDifference]]