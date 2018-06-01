event handling
mouseUp: event 
	| _gsSqueakTemp_clickedMorph _gsSqueakTemp_highlightedMorph |
	_gsSqueakTemp_clickedMorph := self itemFromPoint: event position.
	_gsSqueakTemp_highlightedMorph := self
				valueOfProperty: #highlightedMorph
				ifAbsent: [].
	self removeProperty: #highlightedMorph.
	((model okToChange not
				or: [_gsSqueakTemp_clickedMorph isNil])
			or: [_gsSqueakTemp_clickedMorph ~~ _gsSqueakTemp_highlightedMorph])
		ifTrue: [_gsSqueakTemp_highlightedMorph
				ifNotNil: [:m | m highlightForMouseDown: false].
			^ self].
	((autoDeselect isNil
				or: [autoDeselect])
			and: [_gsSqueakTemp_clickedMorph == selectedMorph])
		ifTrue: [self setSelectedMorph: nil]
		ifFalse: [self setSelectedMorph: _gsSqueakTemp_clickedMorph].
	_gsSqueakTemp_highlightedMorph highlightForMouseDown: false.
	event hand newKeyboardFocus: self.
	Cursor normal show