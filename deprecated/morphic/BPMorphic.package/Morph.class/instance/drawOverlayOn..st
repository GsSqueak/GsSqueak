drawing
drawOverlayOn: aCanvas 
	"Draw something over all my submorphs."
	self drawDropHighlightOn: aCanvas.
	self drawMouseDownHighlightOn: aCanvas.
	(self indicateKeyboardFocus
			and: [self hasKeyboardFocus])
		ifTrue: [self drawKeyboardFocusIndicationOn: aCanvas]