drawing
drawOn: aCanvas

	aCanvas drawString: contents in: (bounds insetBy: 2)  font: self fontToUse color: color.

	border ifNotNil: [aCanvas frameAndFillRectangle: bounds
		fillColor: Color transparent
		borderWidth: 1
		borderColor: Color black].

	aCanvas
			paintImage: SubMenuMarker
			at: (self right - 8 @ ((self top + self bottom - SubMenuMarker height) // 2))