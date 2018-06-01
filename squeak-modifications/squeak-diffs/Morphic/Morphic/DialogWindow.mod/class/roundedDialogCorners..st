preferences
roundedDialogCorners: aBoolean
	
	RoundedDialogCorners = aBoolean ifTrue: [^ self].
	RoundedDialogCorners := aBoolean.
	self refreshAllDialogs.