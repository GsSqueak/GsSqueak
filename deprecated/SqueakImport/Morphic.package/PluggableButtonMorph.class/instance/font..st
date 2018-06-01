accessing
font: aFont

	font = aFont ifTrue: [^ self].
	font := aFont.
	
	self updateMinimumExtent.
	self changed.