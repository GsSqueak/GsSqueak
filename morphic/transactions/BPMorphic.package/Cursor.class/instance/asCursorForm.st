converting
asCursorForm
	| _gsSqueakTemp_form |
	_gsSqueakTemp_form := StaticForm extent: self extent depth: 8.
	_gsSqueakTemp_form
		fillShape: self
		fillColor: Color black
		at: offset negated.
	^ _gsSqueakTemp_form offset: offset