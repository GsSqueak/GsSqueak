selection
selectionIndex: idx 
	"Called internally to select the index-th item."
	| _gsSqueakTemp_theMorph _gsSqueakTemp_index |
	idx
		ifNil: [^ self].
	_gsSqueakTemp_index := idx min: scroller submorphs size max: 0.
	(_gsSqueakTemp_theMorph := _gsSqueakTemp_index = 0
				ifFalse: [scroller submorphs at: _gsSqueakTemp_index])
		ifNotNil: [self scrollToShow: _gsSqueakTemp_theMorph bounds].
	self selectedMorph: _gsSqueakTemp_theMorph