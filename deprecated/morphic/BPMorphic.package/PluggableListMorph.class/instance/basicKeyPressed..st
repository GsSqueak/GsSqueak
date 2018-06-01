model access
basicKeyPressed: aChar 
	| _gsSqueakTemp_milliseconds _gsSqueakTemp_slowKeyStroke _gsSqueakTemp_listSize _gsSqueakTemp_newSelectionIndex _gsSqueakTemp_oldSelectionIndex _gsSqueakTemp_startIndex |
	_gsSqueakTemp_oldSelectionIndex := _gsSqueakTemp_newSelectionIndex := self getCurrentSelectionIndex.
	_gsSqueakTemp_listSize := self getListSize.
	_gsSqueakTemp_listSize = 0
		ifTrue: [^ self flash].
	_gsSqueakTemp_milliseconds := Time millisecondClockValue.
	_gsSqueakTemp_slowKeyStroke := (Time milliseconds: _gsSqueakTemp_milliseconds since: lastKeystrokeTime)
				> (self filterableList
						ifTrue: [500]
						ifFalse: [300]).
	lastKeystrokeTime := _gsSqueakTemp_milliseconds.
	_gsSqueakTemp_slowKeyStroke
		ifTrue: [self filterableList
				ifTrue: [self hasFilter
						ifFalse: [priorSelection := self modelIndexFor: self selectionIndex]].
			"forget previous keystrokes and search in following elements"
			lastKeystrokes := aChar asLowercase asString.
			_gsSqueakTemp_newSelectionIndex := _gsSqueakTemp_newSelectionIndex \\ _gsSqueakTemp_listSize + 1.
			self filterableList
				ifTrue: [list := self getFullList]]
		ifFalse: ["append quick keystrokes but don't move selection if it still
			matches "
			lastKeystrokes := lastKeystrokes , aChar asLowercase asString.
			_gsSqueakTemp_newSelectionIndex := _gsSqueakTemp_newSelectionIndex max: 1].
	"No change if model is locked"
	model okToChange
		ifFalse: [^ self].
	self filterableList
		ifTrue: [self filterList; updateList.
			_gsSqueakTemp_newSelectionIndex := self modelIndexFor: 1]
		ifFalse: [_gsSqueakTemp_startIndex := _gsSqueakTemp_newSelectionIndex.
			_gsSqueakTemp_listSize := self getListSize.
			[(self getListItem: _gsSqueakTemp_newSelectionIndex) asString withBlanksTrimmed asLowercase beginsWith: lastKeystrokes]
				whileFalse: [(_gsSqueakTemp_newSelectionIndex := _gsSqueakTemp_newSelectionIndex \\ _gsSqueakTemp_listSize + 1) = _gsSqueakTemp_startIndex
						ifTrue: [^ self flash"Not in list."]].
			_gsSqueakTemp_newSelectionIndex = _gsSqueakTemp_oldSelectionIndex
				ifTrue: [^ self flash]].
	(self hasFilter
			and: [(self getCurrentSelectionIndex = _gsSqueakTemp_newSelectionIndex) not])
		ifTrue: [self changeModelSelection: _gsSqueakTemp_newSelectionIndex]