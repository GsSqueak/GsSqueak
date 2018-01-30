copying
blankCopyOf: aRectangle scaledBy: scale 
	^ self species extent: (aRectangle extent * scale) truncated depth: depth