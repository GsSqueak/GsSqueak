accessing
highlight
	| _gsSqueakTemp_str |
	isHighlighted := true.
	submorphs notEmpty
		ifTrue: [((_gsSqueakTemp_str := submorphs first) isKindOf: StringMorph)
				ifTrue: [_gsSqueakTemp_str color: self highlightColor]
				ifFalse: [self borderWidth: 1;
						 borderColor: self highlightColor]]