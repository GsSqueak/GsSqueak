new selection
selectInterval: anInterval
	"Deselect, then select the specified characters inclusive.
	 Be sure the selection is in view."

	self selectFrom: anInterval first to: anInterval last