drawing
drawOn: aCanvas

	self drawCornerResizeHandles
		ifTrue: [
			bounds := self bounds.
			aCanvas 
				translucentImage: (self alphaHandle) 
				at: (bounds origin ) 
				sourceRect: (self handleOrigin extent: bounds extent)]