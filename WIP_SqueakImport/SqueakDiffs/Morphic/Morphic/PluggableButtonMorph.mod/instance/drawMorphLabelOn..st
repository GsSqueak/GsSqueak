drawing
drawMorphLabelOn: aCanvas

	| layoutBounds |
	layoutBounds := self layoutBounds.

	self label privateFullMoveBy: (layoutBounds center - self label center).
	
	self clipSubmorphs
		ifTrue: [aCanvas
			clipBy: layoutBounds
			during: [:c | c fullDrawMorph: self label]]
		ifFalse: [aCanvas fullDrawMorph: self label].