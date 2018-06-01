drawing
drawOn: aCanvas 

	aCanvas isShadowDrawing
		ifTrue: [^ aCanvas fillOval: bounds fillStyle: self fillStyle borderWidth: 0 borderColor: nil].
	aCanvas fillOval: bounds fillStyle: self fillStyle borderWidth: borderWidth borderColor: borderColor.
