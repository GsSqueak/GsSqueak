misc
tearOffTileForSelf
	| _gsSqueakTemp_tiles |
	self currentHand attachMorph: (_gsSqueakTemp_tiles := self tileReferringToSelf).
	_gsSqueakTemp_tiles isSyntaxMorph
		ifTrue: [Preferences tileTranslucentDrag
				ifTrue: [_gsSqueakTemp_tiles lookTranslucent]
				ifFalse: [_gsSqueakTemp_tiles align: _gsSqueakTemp_tiles topLeft with: self currentHand position + _gsSqueakTemp_tiles cursorBaseOffset]]