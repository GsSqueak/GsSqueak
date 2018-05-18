drawing
drawOn: aCanvas

	self fillStyle isColor
		ifFalse: [self fillStyle isGradientFill
				ifTrue: [self fillStyle direction: 0 @ self height]].
	"Bubble."
	self wantsRoundedCorners
		ifTrue: [aCanvas
			frameAndFillRoundRect: self bubbleBounds
			radius: self cornerRadius fillStyle: self fillStyle borderWidth: self borderStyle width borderColor: self borderStyle color]
		ifFalse: [aCanvas
			fillRectangle: self bubbleBounds
			fillStyle: self fillStyle borderStyle: self borderStyle].

	"Tail."
	self hasTail ifTrue: [
		self verticesForTail in: [:points |
			| pixelOffset |
			pixelOffset := points first y < points second y
				ifFalse: [points first x < points second x
					ifTrue: [self borderStyle width negated @ self borderStyle width] "bottomLeft"
					ifFalse: [self borderStyle width @ self borderStyle width]] "bottomRight"
				ifTrue: [points first x < points second x
					ifTrue: [self borderStyle width negated @ self borderStyle width negated] "topLeft"
					ifFalse: [self borderStyle width @ self borderStyle width negated]]. "topRight"

			aCanvas
				drawPolygon: points
				fillStyle: self fillStyle.
			aCanvas
				line: points first
				to: points second + pixelOffset
				width: self borderStyle width
				color: self borderStyle color.
			aCanvas
				line: points first
				to: points third + pixelOffset
				width: self borderStyle width
				color: self borderStyle color]]