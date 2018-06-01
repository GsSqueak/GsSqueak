updating
updateList
	"the list has changed -- update from the model"
	| _gsSqueakTemp_index |
	self listMorph listChanged.
	self setScrollDeltas.
	_gsSqueakTemp_index := self getCurrentSelectionIndex.
	self resetPotentialDropRow.
	self
		selectionIndex: (self uiIndexFor: _gsSqueakTemp_index)