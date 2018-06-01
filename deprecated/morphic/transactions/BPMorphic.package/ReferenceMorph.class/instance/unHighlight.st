accessing
unHighlight
	| _gsSqueakTemp_str |
	isHighlighted := false.
	self borderWidth: 0.
	submorphs notEmpty
		ifTrue: [((_gsSqueakTemp_str := submorphs first) isKindOf: StringMorph orOf: RectangleMorph)
				ifTrue: [_gsSqueakTemp_str color: self regularColor]]