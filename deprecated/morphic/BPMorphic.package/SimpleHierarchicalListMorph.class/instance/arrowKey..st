keyboard navigation
arrowKey: asciiValue 
	"Handle a keyboard navigation character. Answer true if handled, false
	if not."
	| _gsSqueakTemp_keyEvent _gsSqueakTemp_max _gsSqueakTemp_oldSelection _gsSqueakTemp_nextSelection _gsSqueakTemp_howManyItemsShowing _gsSqueakTemp_keyHandled |
	_gsSqueakTemp_keyHandled := false.
	_gsSqueakTemp_keyEvent := asciiValue.
	_gsSqueakTemp_max := self maximumSelection.
	_gsSqueakTemp_nextSelection := _gsSqueakTemp_oldSelection := self getSelectionIndex.
	_gsSqueakTemp_keyEvent = 31
		ifTrue: ["down"
			_gsSqueakTemp_keyHandled := true.
			_gsSqueakTemp_nextSelection := _gsSqueakTemp_oldSelection + 1.
			_gsSqueakTemp_nextSelection > _gsSqueakTemp_max
				ifTrue: [_gsSqueakTemp_nextSelection := self class wrappedNavigation
								ifTrue: [1]
								ifFalse: [_gsSqueakTemp_max]]].
	_gsSqueakTemp_keyEvent = 30
		ifTrue: ["up"
			_gsSqueakTemp_keyHandled := true.
			_gsSqueakTemp_nextSelection := _gsSqueakTemp_oldSelection - 1.
			_gsSqueakTemp_nextSelection < 1
				ifTrue: [_gsSqueakTemp_nextSelection := self class wrappedNavigation
								ifTrue: [_gsSqueakTemp_max]
								ifFalse: [1]]].
	_gsSqueakTemp_keyEvent = 1
		ifTrue: ["home"
			_gsSqueakTemp_keyHandled := true.
			_gsSqueakTemp_nextSelection := 1].
	_gsSqueakTemp_keyEvent = 4
		ifTrue: ["end"
			_gsSqueakTemp_keyHandled := true.
			_gsSqueakTemp_nextSelection := _gsSqueakTemp_max].
	_gsSqueakTemp_howManyItemsShowing := self numSelectionsInView.
	_gsSqueakTemp_keyEvent = 11
		ifTrue: ["page up"
			_gsSqueakTemp_keyHandled := true.
			_gsSqueakTemp_nextSelection := 1 max: _gsSqueakTemp_oldSelection - _gsSqueakTemp_howManyItemsShowing].
	_gsSqueakTemp_keyEvent = 12
		ifTrue: ["page down"
			_gsSqueakTemp_keyHandled := true.
			_gsSqueakTemp_nextSelection := _gsSqueakTemp_oldSelection + _gsSqueakTemp_howManyItemsShowing min: _gsSqueakTemp_max].
	(_gsSqueakTemp_nextSelection ~= _gsSqueakTemp_oldSelection
			or: [_gsSqueakTemp_keyHandled
					and: [self class wrappedNavigation not]])
		ifTrue: [self setSelectionIndex: _gsSqueakTemp_nextSelection.
			^ true].
	_gsSqueakTemp_keyEvent = 29
		ifTrue: ["right"
			selectedMorph
				ifNotNil: [(selectedMorph canExpand
							and: [selectedMorph isExpanded not])
						ifTrue: [self toggleExpandedState: selectedMorph]
						ifFalse: [self setSelectionIndex: self getSelectionIndex + 1]].
			^ true].
	_gsSqueakTemp_keyEvent = 28
		ifTrue: ["left"
			selectedMorph
				ifNotNil: [selectedMorph isExpanded
						ifTrue: [self toggleExpandedState: selectedMorph]
						ifFalse: [self
								setSelectionIndex: (self getSelectionIndex - 1 max: 1)]].
			^ true].
	^ false