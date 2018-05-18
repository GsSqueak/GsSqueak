pop up
popUpFor: morph

	self
		popUpFor: morph
		hand: (morph world activeHand ifNil: [morph world primaryHand]).