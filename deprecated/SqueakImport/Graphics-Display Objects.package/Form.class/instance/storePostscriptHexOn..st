postscript generation
storePostscriptHexOn: inner 
	self depth <= 8 ifTrue: [self storeHexBitsOn: inner].
	self depth = 16 ifTrue: [self store15To24HexBitsOn: inner].
	self depth = 32 ifTrue: [self store32To24HexBitsOn: inner]