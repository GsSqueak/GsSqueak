updating
updateList
	| index |
	"the list has changed -- update from the model"
	self listMorph listChanged.
	self setScrollDeltas.
	index := self getCurrentSelectionIndex.
	self resetPotentialDropRow.
	self selectionIndex: (self uiIndexFor: index).
