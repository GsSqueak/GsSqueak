drawing
drawOn: aCanvas 
	self borderStyle
		ifNotNil: [:_gsSqueakTemp_style | _gsSqueakTemp_style frameRectangle: bounds on: aCanvas].
	self isOpaque
		ifTrue: [aCanvas drawImage: image at: self innerBounds origin]
		ifFalse: [aCanvas translucentImage: image at: self innerBounds origin]