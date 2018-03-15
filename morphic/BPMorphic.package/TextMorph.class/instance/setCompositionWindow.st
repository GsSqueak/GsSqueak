editing
setCompositionWindow
	| _gsSqueakTemp_hand |
	_gsSqueakTemp_hand := self primaryHand.
	_gsSqueakTemp_hand
		ifNotNil: [_gsSqueakTemp_hand compositionWindowManager keyboardFocusForAMorph: self]