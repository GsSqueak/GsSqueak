editing dragdrop
addText: aText event: anEvent
	"Used for dropping/inserting text."
	
	| index |
	index := (paragraph characterBlockAtPoint: anEvent position) stringIndex.
	self closeTypeIn.
	
	self selectInvisiblyFrom: index to: index-1.
	self replaceSelectionWith: aText.