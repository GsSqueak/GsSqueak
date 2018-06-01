events
mouseUp: event 
	"The mouse came up within the list; take appropriate action"
	| _gsSqueakTemp_row |
	_gsSqueakTemp_row := self rowAtLocation: event position.
	"aMorph ifNotNil: [aMorph highlightForMouseDown: false]."
	model okToChange
		ifFalse: [^ self].
	"No change if model is locked"
	_gsSqueakTemp_row = self selectionIndex
		ifTrue: [(autoDeselect
					ifNil: [true])
				ifTrue: [_gsSqueakTemp_row = 0
						ifFalse: [self changeModelSelection: 0]]]
		ifFalse: [self
				changeModelSelection: (self modelIndexFor: _gsSqueakTemp_row)].
	event hand newKeyboardFocus: self.
	hasFocus := true.
	Cursor normal show