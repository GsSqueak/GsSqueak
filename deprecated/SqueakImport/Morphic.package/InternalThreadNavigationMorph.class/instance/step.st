stepping
step

	super step.
	(self valueOfProperty: #previousWorldBounds) = self world bounds ifFalse: [
		self positionAppropriately.
	].
	self class knownThreads
		at: threadName
		ifPresent: [ :known |
			known == listOfPages ifFalse: [
				listOfPages := known.
				self removeAllMorphs.
				self addButtons.
			].
		].
