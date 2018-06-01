gc -- compaction
isObjectForwarded: oop 
	"Return true if the given object has a forwarding table entry 
	during a compaction or become operation."
	^ (oop bitAnd: 1) = 0 and: ["(isIntegerObject: oop) not" ((self longAt: oop) bitAnd: self markBit) ~= 0]