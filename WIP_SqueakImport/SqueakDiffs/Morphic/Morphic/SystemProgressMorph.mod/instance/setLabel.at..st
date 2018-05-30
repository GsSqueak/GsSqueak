labelling
setLabel: shortDescription at: slot
	(self labels at: slot) contents: shortDescription.
	self reposition