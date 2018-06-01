other
translateBy: delta clippingTo: aRect during: aBlock
	self comment:'translateBy: ' with:delta.
	^self transformBy:(MatrixTransform2x3 withOffset:delta) clippingTo:aRect during:aBlock.

