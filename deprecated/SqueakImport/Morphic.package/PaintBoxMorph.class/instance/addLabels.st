initialization
addLabels

	Preferences useFormsInPaintBox ifFalse: [
		self addTextualLabels.
	] ifTrue: [
		self addGraphicLabels ifFalse: [self addTextualLabels].
	].
