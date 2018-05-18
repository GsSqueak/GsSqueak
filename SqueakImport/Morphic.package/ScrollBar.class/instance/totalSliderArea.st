geometry
totalSliderArea
	| upperReferenceBounds lowerReferenceBounds |
	upperReferenceBounds := (upButton visible ifFalse: [self menuButton visible ifTrue: [self menuButton] ifFalse: [nil]] ifTrue: [upButton])
		ifNil: [self topLeft corner: (self orientation == #horizontal ifTrue: [self bottomLeft + (1@0)] ifFalse: [self topRight + (0@1)])]
		ifNotNil: [:button | button bounds].
	lowerReferenceBounds := downButton visible
		ifFalse: [(self orientation == #horizontal ifTrue: [self topRight - (1@0)] ifFalse: [self bottomLeft - (0@1)]) corner: self bottomRight]
		ifTrue: [downButton bounds].
	^ self orientation == #horizontal
		ifTrue: [upperReferenceBounds topRight - (1@0) corner: lowerReferenceBounds bottomLeft + (1@0)]
		ifFalse:[upperReferenceBounds bottomLeft - (0@1) corner: lowerReferenceBounds topRight + (0@1)].
