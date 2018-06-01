events
mouseMove: evt 
	"Change the selection in response to mouse-down drag"
	pointBlock := paragraph characterBlockAtPoint: evt position.
	self storeSelectionInParagraph