drawing
drawMouseDownHighlightOn: aCanvas

	self highlightedForMouseDown ifTrue: [
		self wantsRoundedCorners
			ifTrue: [aCanvas frameRoundRect: self fullBounds radius: self cornerRadius width: 1 color: self color darker darker]
			ifFalse: [aCanvas frameRectangle: self fullBounds color: self color darker darker]].