event handling
mouseMove: evt 
	| _gsSqueakTemp_hand _gsSqueakTemp_firstSub |
	_gsSqueakTemp_hand := evt hand.
	((_gsSqueakTemp_hand submorphCount > 0
				and: [(_gsSqueakTemp_firstSub := _gsSqueakTemp_hand submorphs first) ~~ self])
			and: [self wantsDroppedMorph: _gsSqueakTemp_firstSub event: evt])
		ifTrue: [super mouseMove: evt]