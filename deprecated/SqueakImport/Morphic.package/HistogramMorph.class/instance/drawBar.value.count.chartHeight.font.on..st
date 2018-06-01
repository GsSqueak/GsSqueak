drawing
drawBar: aRectangle value: anObject count: anInteger chartHeight: chartHeight font: aFont on: aCanvas

	| label countLabel labelWidth countWidth midX  |
	label := self labelFor: anObject.
	countLabel := self countLabelFor: anInteger.
	labelWidth := aFont widthOfString: label.
	countWidth := aFont widthOfString: countLabel.
	midX := aRectangle origin x + (aRectangle width // 2).
	
	aCanvas fillRectangle: aRectangle color: Color blue.
	self drawLabel: label width: labelWidth at: (midX - (labelWidth // 2) @ chartHeight) barWidth: aRectangle width font: aFont on: aCanvas.
	countWidth < aRectangle width
		ifTrue: [aCanvas drawString: countLabel at: (midX - (countWidth // 2) @ (chartHeight - (3/2 * aFont height))) font: aFont color: Color lightGray].
