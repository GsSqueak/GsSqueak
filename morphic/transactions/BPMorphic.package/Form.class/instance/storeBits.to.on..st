postscript generation
storeBits: startBit to: stopBit on: aStream 
	self unhibernate.
	bits
		storeBits: startBit
		to: stopBit
		on: aStream