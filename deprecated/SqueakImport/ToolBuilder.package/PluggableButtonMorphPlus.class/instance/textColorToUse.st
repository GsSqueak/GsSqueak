drawing
textColorToUse

	^ self enabled
		ifTrue: [super textColorToUse]
		ifFalse: [disabledTextColor ifNil: [Color gray: 0.6]]