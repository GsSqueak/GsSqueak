preferences
roundedWindowCorners: aBoolean

	RoundedWindowCorners = aBoolean ifTrue: [^ self].
	RoundedWindowCorners := aBoolean.
	self refreshAllWindows.