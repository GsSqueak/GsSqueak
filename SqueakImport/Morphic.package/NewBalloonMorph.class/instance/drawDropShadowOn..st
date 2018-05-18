drawing
drawDropShadowOn: aCanvas

	aCanvas 
		translateBy: self shadowOffset 
		during: [ :shadowCanvas |
			(shadowCanvas isVisible: self bubbleBounds) ifTrue: [
				self wantsRoundedCorners
					ifTrue: [shadowCanvas fillRoundRect: self bubbleBounds radius: self cornerRadius fillStyle: self shadowColor]
					ifFalse: [shadowCanvas fillRectangle: self bubbleBounds fillStyle: self shadowColor]].
				
				self hasTail ifTrue: [
					shadowCanvas
						drawPolygon: self verticesForTail
						fillStyle: self shadowColor]].

