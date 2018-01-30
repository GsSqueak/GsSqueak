selection
selectionRectsFrom: characterBlock1 to: characterBlock2 
	"Return an array of rectangles representing the area between the two
	character blocks given as arguments."
	| _gsSqueakTemp_line1 _gsSqueakTemp_line2 _gsSqueakTemp_rects _gsSqueakTemp_cb1 _gsSqueakTemp_cb2 _gsSqueakTemp_w |
	characterBlock1 <= characterBlock2
		ifTrue: [_gsSqueakTemp_cb1 := characterBlock1.
			_gsSqueakTemp_cb2 := characterBlock2]
		ifFalse: [_gsSqueakTemp_cb2 := characterBlock1.
			_gsSqueakTemp_cb1 := characterBlock2].
	_gsSqueakTemp_cb1 = _gsSqueakTemp_cb2
		ifTrue: [_gsSqueakTemp_w := self caretWidth.
			^ Array
				with: (_gsSqueakTemp_cb1 topLeft - (_gsSqueakTemp_w @ 0) corner: _gsSqueakTemp_cb1 bottomLeft + (_gsSqueakTemp_w + 1 @ 0))].
	_gsSqueakTemp_line1 := self lineIndexOfCharacterIndex: _gsSqueakTemp_cb1 stringIndex.
	_gsSqueakTemp_line2 := self lineIndexOfCharacterIndex: _gsSqueakTemp_cb2 stringIndex.
	_gsSqueakTemp_line1 = _gsSqueakTemp_line2
		ifTrue: [^ Array
				with: (_gsSqueakTemp_cb1 topLeft corner: _gsSqueakTemp_cb2 bottomRight)].
	_gsSqueakTemp_rects := OrderedCollection new.
	_gsSqueakTemp_rects
		addLast: (_gsSqueakTemp_cb1 topLeft corner: (lines at: _gsSqueakTemp_line1) bottomRight).
	_gsSqueakTemp_line1 + 1
		to: _gsSqueakTemp_line2 - 1
		do: [:i | 
			| line |
			line := lines at: i.
			(line left = _gsSqueakTemp_rects last left
					and: [line right = _gsSqueakTemp_rects last right])
				ifTrue: [| lastRect |
					"new line has same margins as old one -- merge them,
					so that the caller gets as few rectangles as possible"
					lastRect := _gsSqueakTemp_rects removeLast.
					_gsSqueakTemp_rects
						add: (lastRect bottom: line bottom)]
				ifFalse: ["differing margins; cannot merge"
					_gsSqueakTemp_rects add: line rectangle]].
	_gsSqueakTemp_rects
		addLast: ((lines at: _gsSqueakTemp_line2) topLeft corner: _gsSqueakTemp_cb2 bottomLeft).
	^ _gsSqueakTemp_rects