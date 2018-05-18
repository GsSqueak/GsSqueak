drawing
drawBackgroundOn: aCanvas 

	isSelected & isEnabled
		ifTrue: [aCanvas fillRectangle: self bounds fillStyle: self selectionFillStyle].