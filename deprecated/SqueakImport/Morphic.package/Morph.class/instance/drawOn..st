drawing
drawOn: aCanvas

	self wantsRoundedCorners
		ifTrue: [aCanvas frameAndFillRoundRect: self bounds radius: self cornerRadius fillStyle: self fillStyle borderWidth: self borderStyle width borderColor: self borderStyle color]
		ifFalse: [aCanvas fillRectangle: self bounds fillStyle: self fillStyle borderStyle: self borderStyle].
	
