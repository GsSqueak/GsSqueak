geometry
hScrollBarWidth
	"Return the width of the horizontal scrollbar"
	| _gsSqueakTemp_w |
	_gsSqueakTemp_w := bounds width.
	"- (2 * borderWidth)"
	(retractableScrollBar not
			and: [self vIsScrollbarNeeded])
		ifTrue: [_gsSqueakTemp_w := _gsSqueakTemp_w - self scrollBarThickness].
	^ _gsSqueakTemp_w