geometry ranges
hUnadjustedScrollRange
	"Return the width extent of the receiver's submorphs."
	| _gsSqueakTemp_submorphBounds |
	_gsSqueakTemp_submorphBounds := scroller localSubmorphBounds
				ifNil: [^ 0].
	^ _gsSqueakTemp_submorphBounds right