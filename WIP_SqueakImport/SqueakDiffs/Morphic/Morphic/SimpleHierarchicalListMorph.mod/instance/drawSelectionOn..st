drawing
drawSelectionOn: aCanvas 

	self selectedMorph ifNotNil: [:m |
		aCanvas
			transformBy: scroller transform
			clippingTo: scroller innerBounds
			during: [:c | m drawSelectionOn: c] ].