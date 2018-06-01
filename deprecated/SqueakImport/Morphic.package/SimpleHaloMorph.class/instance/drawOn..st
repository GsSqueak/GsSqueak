drawing
drawOn: aCanvas 
	"Draw this morph only if it has no target."

	(Preferences showBoundsInHalo and: [self target isWorldMorph not])
		ifTrue: [
			aCanvas
				frameAndFillRectangle: self bounds
				fillColor: Color transparent
				borderWidth: 2
				borderColor: (self userInterfaceTheme borderColor ifNil: [Color blue alpha: 0.8])]