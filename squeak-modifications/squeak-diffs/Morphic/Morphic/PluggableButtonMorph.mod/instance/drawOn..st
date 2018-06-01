drawing
drawOn: aCanvas 

	(self fillStyle isColor not and: [self fillStyle isGradientFill])
		ifTrue: [self fillStyle origin: self topLeft; direction: 0@ self height].

	super drawOn: aCanvas.
	
	aCanvas
		translateBy: self labelOffset
		during: [:c |
			self label isMorph
				ifTrue: [self drawMorphLabelOn: c]
				ifFalse: [self drawLabelOn: c]].