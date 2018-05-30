accessing
slideBy: inc
	submorphs isEmpty ifTrue: [^ self].
	offset := offset + inc \\ self subBounds extent.
	self changed