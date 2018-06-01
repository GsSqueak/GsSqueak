drawing
drawDropHighlightOn: aCanvas 
	self highlightedForDrop
		ifTrue: [self wantsRoundedCorners
				ifTrue: [aCanvas
						frameRoundRect: self fullBounds
						radius: self cornerRadius
						width: 1
						color: self dropHighlightColor]
				ifFalse: [aCanvas frameRectangle: self fullBounds color: self dropHighlightColor]]