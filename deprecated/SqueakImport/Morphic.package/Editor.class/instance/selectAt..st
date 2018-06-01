new selection
selectAt: characterIndex 
	"Deselect, then place the caret before the character at characterIndex.
	 Be sure it is in view."

	self selectFrom: characterIndex to: characterIndex - 1