geometry
hResizeScrollBar

	| topLeft h border offset |
	self hScrollBarPolicy == #never ifTrue: [^self].
	bounds ifNil: [ self fullBounds ].
	
	h := self scrollBarThickness.
	border := borderWidth.
	offset := (scrollBarOnLeft and: [self vIsScrollbarShowing and: [retractableScrollBar not]])
		ifTrue: [h]
		ifFalse: [0].
	
	topLeft := retractableScrollBar
				ifTrue: [bounds bottomLeft + (offset @ border negated)]
				ifFalse: [bounds bottomLeft + (offset @ h negated)].

	hScrollBar bounds: (topLeft extent: self hScrollBarWidth@ h)