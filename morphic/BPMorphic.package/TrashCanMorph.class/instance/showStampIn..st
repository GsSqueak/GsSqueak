private
showStampIn: aHand 
	"If painting and in stamp mode, show the stamp that is about to be
	thrown away."
	| _gsSqueakTemp_paintBox _gsSqueakTemp_curs |
	_gsSqueakTemp_paintBox := self findActivePaintBox.
	_gsSqueakTemp_paintBox
		ifNotNil: ["See if a stamp is being dropped into the trash. It is not
			actually held by the hand."
			_gsSqueakTemp_paintBox getSpecial == #stamp:
				ifTrue: [_gsSqueakTemp_curs := _gsSqueakTemp_paintBox actionCursor.
					aHand showTemporaryCursor: _gsSqueakTemp_curs hotSpotOffset: _gsSqueakTemp_curs center]]