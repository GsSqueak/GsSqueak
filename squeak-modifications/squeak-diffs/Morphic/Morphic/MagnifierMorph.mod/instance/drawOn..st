drawing
drawOn: aCanvas
	super drawOn: aCanvas.		"border and fill"
	aCanvas isShadowDrawing ifFalse: [
		"Optimize because #magnifiedForm is expensive"
		aCanvas paintImage: self magnifiedForm at: self innerBounds origin]