initialization
addLabels
	Preferences useFormsInPaintBox
		ifTrue: [self addGraphicLabels
				ifFalse: [self addTextualLabels]]
		ifFalse: [self addTextualLabels]