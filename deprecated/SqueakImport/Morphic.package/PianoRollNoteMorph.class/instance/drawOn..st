drawing
drawOn: aCanvas

	selected
		ifTrue: [aCanvas frameAndFillRectangle: self fullBounds fillColor: color borderWidth: 1 borderColor: Color black]
		ifFalse: [aCanvas fillRectangle: self bounds color: color].
