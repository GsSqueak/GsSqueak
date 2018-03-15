accessing
textColor: aColor 
	color = aColor
		ifTrue: [^ self].
	color := aColor.
	self changed