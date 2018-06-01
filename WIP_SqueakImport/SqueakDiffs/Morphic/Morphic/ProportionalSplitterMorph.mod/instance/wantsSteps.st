events
wantsSteps
	^ splitsTopAndBottom
		ifTrue: [ self class smartHorizontalSplitters ]
		ifFalse: [ self class smartVerticalSplitters ]