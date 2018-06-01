instance creation
newBounds: bounds model: thang slotName: nameOfThisPart
	^ (super new model: thang slotName: nameOfThisPart)
		newBounds: bounds