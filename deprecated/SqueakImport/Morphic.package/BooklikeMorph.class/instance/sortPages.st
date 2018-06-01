menu commands
sortPages
	| sorter |
	sorter := BookPageSorterMorph new
		book: self morphsToSort: self morphsForPageSorter.
	sorter pageHolder cursor: self pageNumber.
	"Align at bottom right of screen, but leave 20-pix margin."
	self bottom + sorter height < Display height ifTrue: "Place it below if it fits"
		[^ self world addMorphFront: (sorter align: sorter topLeft with: self bottomLeft)].
	self right + sorter width < Display width ifTrue: "Place it below if it fits"
		[^ self world addMorphFront: (sorter align: sorter bottomLeft with: self bottomRight)].
	"Otherwise, place it at lower right of screen"
	self world addMorphFront: (sorter position: Display extent - (20@20) - sorter extent).
