initialization
list: arrayOfLists 
	| listOfStrings |
	lists := arrayOfLists.
	scroller removeAllMorphs.
	listOfStrings := arrayOfLists == nil
				ifTrue: [Array new]
				ifFalse: [
					arrayOfLists isEmpty ifFalse: [
					arrayOfLists at: 1]].
	list := listOfStrings
				ifNil: [Array new].
	self listMorph listChanged..

	self setScrollDeltas.
	scrollBar setValue: 0.0