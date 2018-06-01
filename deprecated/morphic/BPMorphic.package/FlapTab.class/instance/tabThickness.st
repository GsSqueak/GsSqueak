access
tabThickness
	^ self orientation == #vertical
		ifTrue: [self width]
		ifFalse: [self height]