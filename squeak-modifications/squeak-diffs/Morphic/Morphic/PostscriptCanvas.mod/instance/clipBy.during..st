drawing-support
clipBy: aRectangle during: aBlock
	^self translateBy: 0@0 clippingTo: aRectangle during: aBlock.
