event handling
doubleClick: evt 
	| _gsSqueakTemp_palette |
	_gsSqueakTemp_palette := self standardPalette.
	((_gsSqueakTemp_palette notNil
				and: [_gsSqueakTemp_palette isInWorld])
			and: [_gsSqueakTemp_palette hasScrapsTab])
		ifTrue: [_gsSqueakTemp_palette showScrapsTab]
		ifFalse: [self world openScrapsBook: evt]