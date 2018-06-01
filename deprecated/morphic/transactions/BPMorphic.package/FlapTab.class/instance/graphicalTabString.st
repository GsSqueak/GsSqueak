graphical tabs
graphicalTabString
	^ self isCurrentlyGraphical
		ifTrue: ['choose new graphic...' translated]
		ifFalse: ['use graphical tab' translated]