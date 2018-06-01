drawing
drawOn: aCanvas
	| style |
	(style := self borderStyle) ifNotNil:[
		style frameRectangle: bounds on: aCanvas.
	].
	self isOpaque
		ifTrue:[aCanvas drawImage: image at: self innerBounds origin]
		ifFalse:[aCanvas translucentImage: image at: self innerBounds origin]