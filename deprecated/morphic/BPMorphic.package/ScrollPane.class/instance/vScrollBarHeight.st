geometry
vScrollBarHeight
	| _gsSqueakTemp_h |
	_gsSqueakTemp_h := bounds height.
	"- (2 * borderWidth)"
	(retractableScrollBar not
			and: [self hIsScrollbarNeeded])
		ifTrue: [_gsSqueakTemp_h := _gsSqueakTemp_h - self scrollBarThickness].
	^ _gsSqueakTemp_h