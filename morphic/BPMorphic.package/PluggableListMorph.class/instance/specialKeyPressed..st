model access
specialKeyPressed: asciiValue 
	"A special key with the given ascii-value was pressed; dispatch it"
	| _gsSqueakTemp_oldSelection _gsSqueakTemp_nextSelection _gsSqueakTemp_max _gsSqueakTemp_howManyItemsShowing |
	(#(8 13) includes: asciiValue)
		ifTrue: ["backspace key - clear the filter, restore the list with the
			selection "
			model okToChange
				ifFalse: [^ self].
			self removeFilter.
			priorSelection
				ifNotNil: [| prior |
					prior := priorSelection.
					priorSelection := self getCurrentSelectionIndex.
					asciiValue = 8
						ifTrue: [self changeModelSelection: prior]].
			^ self updateList].
	asciiValue = 27
		ifTrue: ["escape key"
			^ ActiveEvent shiftPressed
				ifTrue: [ActiveWorld putUpWorldMenuFromEscapeKey]
				ifFalse: [self yellowButtonActivity: false]].
	_gsSqueakTemp_max := self maximumSelection.
	_gsSqueakTemp_max > 0
		ifFalse: [^ self].
	_gsSqueakTemp_nextSelection := _gsSqueakTemp_oldSelection := self selectionIndex.
	asciiValue = 31
		ifTrue: ["down arrow"
			_gsSqueakTemp_nextSelection := _gsSqueakTemp_oldSelection + 1.
			_gsSqueakTemp_nextSelection > _gsSqueakTemp_max
				ifTrue: [_gsSqueakTemp_nextSelection := 1]].
	asciiValue = 30
		ifTrue: ["up arrow"
			_gsSqueakTemp_nextSelection := _gsSqueakTemp_oldSelection - 1.
			_gsSqueakTemp_nextSelection < 1
				ifTrue: [_gsSqueakTemp_nextSelection := _gsSqueakTemp_max]].
	asciiValue = 1
		ifTrue: ["home"
			_gsSqueakTemp_nextSelection := 1].
	asciiValue = 4
		ifTrue: ["end"
			_gsSqueakTemp_nextSelection := _gsSqueakTemp_max].
	_gsSqueakTemp_howManyItemsShowing := self numSelectionsInView.
	asciiValue = 11
		ifTrue: ["page up"
			_gsSqueakTemp_nextSelection := 1 max: _gsSqueakTemp_oldSelection - _gsSqueakTemp_howManyItemsShowing].
	asciiValue = 12
		ifTrue: ["page down"
			_gsSqueakTemp_nextSelection := _gsSqueakTemp_oldSelection + _gsSqueakTemp_howManyItemsShowing min: _gsSqueakTemp_max].
	model okToChange
		ifFalse: [^ self].
	"No change if model is locked"
	_gsSqueakTemp_oldSelection = _gsSqueakTemp_nextSelection
		ifTrue: [^ self flash].
	^ self
		changeModelSelection: (self modelIndexFor: _gsSqueakTemp_nextSelection)