menu
isCurrentlyTextual
	| _gsSqueakTemp_first |
	^ submorphs notEmpty
		and: [((_gsSqueakTemp_first := submorphs first) isKindOf: StringMorph)
				or: [_gsSqueakTemp_first isTextMorph]]