menu commands
sortPages
	| _gsSqueakTemp_sorter |
	_gsSqueakTemp_sorter := BookPageSorterMorph new book: self morphsToSort: self morphsForPageSorter.
	_gsSqueakTemp_sorter pageHolder cursor: self pageNumber.
	"Align at bottom right of screen, but leave 20-pix margin."
	self bottom + _gsSqueakTemp_sorter height < Display height
		ifTrue: ["Place it below if it fits"
			^ self world
				addMorphFront: (_gsSqueakTemp_sorter align: _gsSqueakTemp_sorter topLeft with: self bottomLeft)].
	self right + _gsSqueakTemp_sorter width < Display width
		ifTrue: ["Place it below if it fits"
			^ self world
				addMorphFront: (_gsSqueakTemp_sorter align: _gsSqueakTemp_sorter bottomLeft with: self bottomRight)].
	"Otherwise, place it at lower right of screen"
	self world
		addMorphFront: (_gsSqueakTemp_sorter position: Display extent - (20 @ 20) - _gsSqueakTemp_sorter extent)