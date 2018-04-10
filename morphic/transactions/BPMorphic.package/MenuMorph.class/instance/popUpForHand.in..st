control
popUpForHand: hand in: aWorld 
	"Present this menu under control of the given hand."
	| _gsSqueakTemp_p |
	_gsSqueakTemp_p := hand position truncated.
	^ self
		popUpAt: _gsSqueakTemp_p
		forHand: hand
		in: aWorld