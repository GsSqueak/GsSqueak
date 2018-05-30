selecting
contentsIsString
	"Hacked so contents empty when deselected and = long printString when item 3"

	^ (selectionIndex = 3) | (selectionIndex = 0) |
		(selectionIndex = 2 and: [object actualStackSize = 0])