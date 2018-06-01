stack pages
setHeadFP: theFP andSP: theSP inPage: thePage 
	self assert: theSP < theFP.
	self
		assert: (theSP < thePage baseAddress
				and: [theSP > (thePage realStackLimit - (LargeContextSlots * objectMemory bytesPerOop))]).
	self
		assert: (theFP < thePage baseAddress
				and: [theFP > (thePage realStackLimit - (LargeContextSlots * objectMemory bytesPerOop / 2))]).
	thePage headFP: theFP;
		 headSP: theSP