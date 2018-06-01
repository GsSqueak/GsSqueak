drawing
drawMorphLabelOn: aCanvas 
	| _gsSqueakTemp_layoutBounds |
	_gsSqueakTemp_layoutBounds := self layoutBounds.
	self label privateFullMoveBy: _gsSqueakTemp_layoutBounds center - self label center.
	self clipSubmorphs
		ifTrue: [aCanvas
				clipBy: _gsSqueakTemp_layoutBounds
				during: [:c | c fullDrawMorph: self label]]
		ifFalse: [aCanvas fullDrawMorph: self label]