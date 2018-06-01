events
mouseUp: event 
	"The mouse came up within the list; take appropriate action"
	| row |
	row := self rowAtLocation: event position.
	"aMorph ifNotNil: [aMorph highlightForMouseDown: false]."
	model okToChange
		ifFalse: [^ self].
	"No change if model is locked"
	row = self selectionIndex
		ifTrue: [(autoDeselect ifNil: [true]) ifTrue:[row = 0 ifFalse: [self changeModelSelection: 0] ]]
		ifFalse: [self changeModelSelection: (self modelIndexFor: row)].
	event hand newKeyboardFocus: self. 
	hasFocus := true.
	Cursor normal show