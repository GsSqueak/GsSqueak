events
mouseMove: evt
	"Change the selection in response to mouse-down drag. Do not change the selection if the user wants to drag the current selection."

	(morph hasProperty: #waitingForTextDrag) ifTrue: [^ self].
	pointBlock := paragraph characterBlockAtPoint: evt position.
	self storeSelectionInParagraph