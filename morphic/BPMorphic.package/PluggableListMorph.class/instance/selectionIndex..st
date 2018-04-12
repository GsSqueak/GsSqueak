selection
selectionIndex: index 
	"Called internally to select the index-th item."
	| _gsSqueakTemp_row |
	self unhighlightSelection.
	_gsSqueakTemp_row := index
				ifNil: [0].
	_gsSqueakTemp_row := _gsSqueakTemp_row min: self getListSize.
	"make sure we don't select past the end"
	self listMorph selectedRow: _gsSqueakTemp_row.
	self highlightSelection.
	self scrollSelectionIntoView