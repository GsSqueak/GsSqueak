examples
example2
	| _gsSqueakTemp_window _gsSqueakTemp_scrollPane _gsSqueakTemp_pasteUpMorph _gsSqueakTemp_point _gsSqueakTemp_textMorph |
	_gsSqueakTemp_window := SystemWindow new.
	_gsSqueakTemp_scrollPane := ScrollPane new.
	_gsSqueakTemp_pasteUpMorph := PasteUpMorph new.
	_gsSqueakTemp_pasteUpMorph extent: 1000 @ 1000.
	_gsSqueakTemp_scrollPane scroller addMorph: _gsSqueakTemp_pasteUpMorph.
	_gsSqueakTemp_window
		addMorph: _gsSqueakTemp_scrollPane
		frame: (0 @ 0 corner: 1 @ 1).
	0
		to: 1000
		by: 100
		do: [:x | 0
				to: 1000
				by: 100
				do: [:y | 
					_gsSqueakTemp_point := x @ y.
					_gsSqueakTemp_textMorph := TextMorph new contents: _gsSqueakTemp_point asString.
					_gsSqueakTemp_textMorph position: _gsSqueakTemp_point.
					_gsSqueakTemp_pasteUpMorph addMorph: _gsSqueakTemp_textMorph]].
	_gsSqueakTemp_window openInWorld