balloon compatibility
drawRectangle: r color: color borderWidth: borderWidth borderColor: borderColor

	| fillC |
	fillC := self shadowColor
				ifNil: [color].
	^ self
		frameAndFillRectangle: r
		fillColor: fillC
		borderWidth: borderWidth
		borderColor: borderColor