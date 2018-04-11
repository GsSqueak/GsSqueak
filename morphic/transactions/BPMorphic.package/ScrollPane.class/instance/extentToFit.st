geometry
extentToFit
	"Resize scroll pane to exactly fit its contents."
	| _gsSqueakTemp_offset |
	_gsSqueakTemp_offset := 0 @ 0.
	(retractableScrollBar not
			and: [self vScrollBarPolicy == #always])
		ifTrue: [_gsSqueakTemp_offset := self scrollBarThickness - self borderWidth @ _gsSqueakTemp_offset y].
	(retractableScrollBar not
			and: [self hScrollBarPolicy == #always])
		ifTrue: [_gsSqueakTemp_offset := _gsSqueakTemp_offset x @ (self scrollBarThickness - self borderWidth)].
	^ scroller submorphBounds extent + _gsSqueakTemp_offset + (2 * (self borderWidth @ self borderWidth))