selection
scrollSelectionIntoView
	"make sure that the current selection is visible"
	| _gsSqueakTemp_row |
	_gsSqueakTemp_row := self uiIndexFor: self getCurrentSelectionIndex.
	_gsSqueakTemp_row = 0
		ifTrue: [^ self].
	self
		scrollToShow: (self listMorph drawBoundsForRow: _gsSqueakTemp_row)