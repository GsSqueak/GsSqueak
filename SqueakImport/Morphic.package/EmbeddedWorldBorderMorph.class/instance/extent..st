geometry
extent: aPoint

	bounds extent = aPoint ifFalse: [
		self changed.
		bounds := bounds topLeft extent: aPoint.
		self myWorldChanged.
	].
