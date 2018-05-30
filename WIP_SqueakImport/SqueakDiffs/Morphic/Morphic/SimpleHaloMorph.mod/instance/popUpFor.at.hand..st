pop up
popUpFor: morph at: position hand: hand

	self target: morph.
	
	hand halo: self.
	hand world addMorphFront: self.
	
	self positionOffset: position - (morph point: morph position in: self owner).