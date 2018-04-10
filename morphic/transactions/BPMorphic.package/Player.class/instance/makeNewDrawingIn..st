scripts-standard
makeNewDrawingIn: paintPlacePlayer 
	| _gsSqueakTemp_paintPlace |
	((paintPlacePlayer isNil
				or: [((_gsSqueakTemp_paintPlace := paintPlacePlayer costume) isKindOf: PasteUpMorph) not])
			or: [_gsSqueakTemp_paintPlace isInWorld not])
		ifTrue: [^ self inform: 'Error: not a plausible
place in which to make
a new drawing'].
	_gsSqueakTemp_paintPlace makeNewDrawingWithin