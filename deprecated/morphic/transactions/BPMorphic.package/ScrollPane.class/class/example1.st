examples
example1
	| _gsSqueakTemp_window _gsSqueakTemp_scrollPane _gsSqueakTemp_pasteUpMorph |
	_gsSqueakTemp_window := SystemWindow new.
	_gsSqueakTemp_scrollPane := ScrollPane new.
	_gsSqueakTemp_pasteUpMorph := PasteUpMorph new.
	_gsSqueakTemp_pasteUpMorph extent: 1000 @ 1000.
	_gsSqueakTemp_scrollPane scroller addMorph: _gsSqueakTemp_pasteUpMorph.
	_gsSqueakTemp_window
		addMorph: _gsSqueakTemp_scrollPane
		frame: (0 @ 0 corner: 1 @ 1).
	_gsSqueakTemp_window openInWorld