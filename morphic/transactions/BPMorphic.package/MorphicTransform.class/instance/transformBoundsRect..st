transformations
transformBoundsRect: aRectangle 
	"Return a rectangle whose coordinates have been transformed
	from global to local coordinates. NOTE: if the transformation
	is not just a translation, then it will compute the bounding box
	in global coordinates."
	| _gsSqueakTemp_outerRect |
	self isPureTranslation
		ifTrue: [^ (self transform: aRectangle topLeft)
				corner: (self transform: aRectangle bottomRight)]
		ifFalse: [_gsSqueakTemp_outerRect := Rectangle
						encompassing: (aRectangle innerCorners
								collect: [:p | self transform: p]).
			"Following asymmetry due to likely subsequent truncation"
			^ _gsSqueakTemp_outerRect topLeft - (1 @ 1) corner: _gsSqueakTemp_outerRect bottomRight + (2 @ 2)]