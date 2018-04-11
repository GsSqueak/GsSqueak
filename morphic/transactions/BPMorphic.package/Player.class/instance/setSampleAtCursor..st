slot getters/setters
setSampleAtCursor: aNumber 
	"Note: Performance hacked to allow real-time sound. Assumes costume
	is a GraphMorph."
	self setCostumeSlot: #valueAtCursor: toValue: aNumber