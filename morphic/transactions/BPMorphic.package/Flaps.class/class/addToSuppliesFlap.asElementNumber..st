construction support
addToSuppliesFlap: aMorph asElementNumber: aNumber 
	"Add the given morph to the supplies flap. To be called by doits in
	updates, so don't be alarmed by its lack of senders."
	self
		addMorph: aMorph
		asElementNumber: aNumber
		inGlobalFlapWithID: 'Supplies'