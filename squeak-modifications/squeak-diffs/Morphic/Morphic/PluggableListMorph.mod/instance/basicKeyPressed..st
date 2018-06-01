model access
basicKeyPressed: aChar 
	| milliseconds slowKeyStroke listSize newSelectionIndex oldSelectionIndex startIndex |
	oldSelectionIndex := newSelectionIndex := self getCurrentSelectionIndex.
	listSize := self getListSize.
	listSize = 0 ifTrue: [ ^self flash ].
	milliseconds := Time millisecondClockValue.
	slowKeyStroke := (Time
		milliseconds: milliseconds
		since: lastKeystrokeTime) > (self filterableList ifTrue: [500] ifFalse: [ 300 ]).
	lastKeystrokeTime := milliseconds.
	slowKeyStroke
		ifTrue:
			[ self filterableList ifTrue: [ self hasFilter ifFalse: [ priorSelection := self modelIndexFor: self selectionIndex] ].
			"forget previous keystrokes and search in following elements"
			lastKeystrokes := aChar asLowercase asString.
			newSelectionIndex := newSelectionIndex \\ listSize + 1.
			self filterableList ifTrue: [ list := self getFullList ] ]
		ifFalse: [ "append quick keystrokes but don't move selection if it still matches"
			lastKeystrokes := lastKeystrokes , aChar asLowercase asString.
			newSelectionIndex := newSelectionIndex max: 1 ].
	"No change if model is locked"
	model okToChange ifFalse: [ ^ self ].
	self filterableList
		ifTrue:
			[ self
				 filterList ;
				 updateList.
			newSelectionIndex := self modelIndexFor: 1 ]
		ifFalse:
			[ startIndex := newSelectionIndex.
			listSize := self getListSize.
			[ (self getListItem: newSelectionIndex) asString withBlanksTrimmed asLowercase beginsWith: lastKeystrokes ] whileFalse:
				[ (newSelectionIndex := newSelectionIndex \\ listSize + 1) = startIndex ifTrue: [ ^ self flash"Not in list." ] ].
			newSelectionIndex = oldSelectionIndex ifTrue: [ ^ self flash ] ].
	(self hasFilter and: [(self getCurrentSelectionIndex = newSelectionIndex) not]) ifTrue:
		[self changeModelSelection: newSelectionIndex]