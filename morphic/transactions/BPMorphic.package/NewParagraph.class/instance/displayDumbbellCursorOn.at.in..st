display
displayDumbbellCursorOn: aCanvas at: leftX in: line 
	| _gsSqueakTemp_w |
	_gsSqueakTemp_w := 2.
	self focused
		ifFalse: [^ _gsSqueakTemp_w].
	1
		to: _gsSqueakTemp_w
		do: [:i | 
			"Draw caret triangles at top and bottom"
			aCanvas
				fillRectangle: (leftX - _gsSqueakTemp_w + i - 1 @ (line top + i - 1) extent: _gsSqueakTemp_w - i * 2 + 3 @ 1)
				color: self caretColor.
			aCanvas
				fillRectangle: (leftX - _gsSqueakTemp_w + i - 1 @ (line bottom - i) extent: _gsSqueakTemp_w - i * 2 + 3 @ 1)
				color: self caretColor].
	aCanvas
		line: leftX @ line top
		to: leftX @ (line bottom - 1)
		color: self caretColor.
	^ _gsSqueakTemp_w