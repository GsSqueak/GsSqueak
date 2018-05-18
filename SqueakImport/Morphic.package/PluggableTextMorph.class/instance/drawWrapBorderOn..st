drawing
drawWrapBorderOn: aCanvas

	| offset rect |
	self wantsWrapBorder ifFalse: [^ self].
	textMorph ifNil: [^ self].
	
	offset := textMorph margins isRectangle
		ifTrue: [textMorph margins left]
		ifFalse: [textMorph margins isPoint
			ifTrue: [textMorph margins x]
			ifFalse: [textMorph margins]].
	offset := offset + ((textMorph textStyle defaultFont widthOf: $x) * self class visualWrapBorderLimit).
	offset > self width ifTrue: [^ self].
	
	rect := scroller topLeft + (offset @ 0) corner: scroller bottomRight.

	aCanvas
		fillRectangle: rect
		color: self wrapBorderColor.
	aCanvas
		line: rect topLeft
		to: rect bottomLeft
		width: self borderStyle width
		color: (self wrapBorderColor muchDarker alpha: 0.5).