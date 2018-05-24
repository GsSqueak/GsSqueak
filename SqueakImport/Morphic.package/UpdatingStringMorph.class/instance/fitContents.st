accessing
fitContents

	| newExtent |
	newExtent := self measureContents.
	newExtent := ((newExtent x max: self minimumWidth) min: self maximumWidth) @ newExtent y.
	(self extent = newExtent) ifFalse:
		[self extent: newExtent.
		self changed]
