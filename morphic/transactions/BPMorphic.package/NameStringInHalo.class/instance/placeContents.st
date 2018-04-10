as yet unclassified
placeContents
	| _gsSqueakTemp_namePosition |
	(owner notNil
			and: [owner isInWorld])
		ifTrue: [_gsSqueakTemp_namePosition := owner basicBox bottomCenter - (self width // 2 @ (owner handleSize negated // 2 - 1)).
			_gsSqueakTemp_namePosition := _gsSqueakTemp_namePosition min: self world viewBox bottomRight - self extent y + 2.
			self
				bounds: (_gsSqueakTemp_namePosition extent: self extent)]