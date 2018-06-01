initialization
font: aFontOrNil

	self listMorph font: aFontOrNil.
	
	self minimumWidth: (self font widthOf: $m) * 5.
