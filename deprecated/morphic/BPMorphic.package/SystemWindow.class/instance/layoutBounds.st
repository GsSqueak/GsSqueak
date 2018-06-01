layout
layoutBounds
	"Bounds of pane area only."
	| _gsSqueakTemp_box |
	_gsSqueakTemp_box := super layoutBounds.
	^ _gsSqueakTemp_box withTop: _gsSqueakTemp_box top + self labelHeight