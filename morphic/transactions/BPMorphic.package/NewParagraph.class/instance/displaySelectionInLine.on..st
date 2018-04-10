display
displaySelectionInLine: line on: aCanvas 
	| _gsSqueakTemp_leftX _gsSqueakTemp_rightX _gsSqueakTemp_w |
	selectionStart
		ifNil: [^ self].
	"No selection"
	aCanvas isShadowDrawing
		ifTrue: [^ self].
	"don't draw selection with shadow"
	selectionStart = selectionStop
		ifTrue: ["Only show caret on line where clicked"
			selectionStart textLine ~= line
				ifTrue: [^ self]]
		ifFalse: ["Test entire selection before or after here"
			(selectionStop stringIndex < line first
					or: [selectionStart stringIndex > (line last + 1)])
				ifTrue: [^ self].
			"No selection on this line"
			(selectionStop stringIndex = line first
					and: [selectionStop textLine ~= line])
				ifTrue: [^ self].
			"Selection ends on line above"
			(selectionStart stringIndex = (line last + 1)
					and: [selectionStop textLine ~= line])
				ifTrue: [^ self]].
	"Selection begins on line below"
	_gsSqueakTemp_leftX := (selectionStart stringIndex <= line first
				ifTrue: [line]
				ifFalse: [selectionStart]) left.
	_gsSqueakTemp_rightX := (selectionStop stringIndex > (line last + 1)
					or: [selectionStop stringIndex = (line last + 1)
							and: [selectionStop textLine ~= line]])
				ifTrue: [line right]
				ifFalse: [selectionStop left].
	selectionStart = selectionStop
		ifTrue: [_gsSqueakTemp_rightX := _gsSqueakTemp_rightX + 1.
			caretRect := _gsSqueakTemp_leftX - 2 @ line top corner: _gsSqueakTemp_rightX + 2 @ line bottom.
			"sigh..."
			self showCaret
				ifFalse: [^ self].
			_gsSqueakTemp_w := Editor dumbbellCursor
						ifTrue: [self
								displayDumbbellCursorOn: aCanvas
								at: _gsSqueakTemp_leftX
								in: line]
						ifFalse: [self
								displaySimpleCursorOn: aCanvas
								at: _gsSqueakTemp_leftX
								in: line].
			caretRect := _gsSqueakTemp_leftX - _gsSqueakTemp_w @ line top corner: _gsSqueakTemp_rightX + _gsSqueakTemp_w @ line bottom]
		ifFalse: [caretRect := nil.
			aCanvas
				fillRectangle: (_gsSqueakTemp_leftX @ line top corner: _gsSqueakTemp_rightX @ line bottom)
				color: (self focused
						ifTrue: [self selectionColor]
						ifFalse: [self unfocusedSelectionColor])]