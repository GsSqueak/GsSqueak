textual tabs
textualTabString
	^ self isCurrentlyTextual
		ifTrue: ['change tab wording...' translated]
		ifFalse: ['use textual tab' translated]