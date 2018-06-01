colors
existingPaneColor
	"Answer the existing pane color for the window, obtaining it from the
	first paneMorph if any, and fall back on using the second stripe color if
	necessary. "
	| _gsSqueakTemp_aColor |
	_gsSqueakTemp_aColor := self valueOfProperty: #paneColor.
	_gsSqueakTemp_aColor
		ifNil: [self setProperty: #paneColor toValue: (_gsSqueakTemp_aColor := self paneColor)].
	^ _gsSqueakTemp_aColor