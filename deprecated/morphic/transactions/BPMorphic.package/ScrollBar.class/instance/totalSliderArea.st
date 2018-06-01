geometry
totalSliderArea
	| _gsSqueakTemp_upperReferenceBounds _gsSqueakTemp_lowerReferenceBounds |
	_gsSqueakTemp_upperReferenceBounds := (upButton visible
				ifTrue: [upButton]
				ifFalse: [self menuButton visible
						ifTrue: [self menuButton]])
				ifNil: [self topLeft
						corner: (self orientation == #horizontal
								ifTrue: [self bottomLeft + (1 @ 0)]
								ifFalse: [self topRight + (0 @ 1)])]
				ifNotNil: [:button | button bounds].
	_gsSqueakTemp_lowerReferenceBounds := downButton visible
				ifTrue: [downButton bounds]
				ifFalse: [(self orientation == #horizontal
						ifTrue: [self topRight - (1 @ 0)]
						ifFalse: [self bottomLeft - (0 @ 1)])
						corner: self bottomRight].
	^ self orientation == #horizontal
		ifTrue: [_gsSqueakTemp_upperReferenceBounds topRight - (1 @ 0) corner: _gsSqueakTemp_lowerReferenceBounds bottomLeft + (1 @ 0)]
		ifFalse: [_gsSqueakTemp_upperReferenceBounds bottomLeft - (0 @ 1) corner: _gsSqueakTemp_lowerReferenceBounds topRight + (0 @ 1)]