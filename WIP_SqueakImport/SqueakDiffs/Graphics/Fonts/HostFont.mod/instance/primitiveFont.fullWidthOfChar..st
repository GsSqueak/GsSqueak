primitives
primitiveFont: fontHandle fullWidthOfChar: aCharIndex 
	self notYetImplemented.
	^Array 
		with: 0
		with: (self primitiveFont: fontHandle widthOfChar: aCharIndex)
		with: 0