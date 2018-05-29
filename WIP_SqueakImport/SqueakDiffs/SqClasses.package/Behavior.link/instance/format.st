accessing
format
	"Answer an Integer that encodes the kinds and numbers of variables of 
	 instances of the receiver.  The format is (currently) composed of two fields,
	 a 16-bit instSize, in the least significant bits, specifying the number of named
	 inst vars, if any, and a 5-bit format field, describing the kind of class.  c.f. instSpec.
		(msb)<5 bit format><16 bit #fixed fields>(lsb)"

	^ (self instSpec bitShift: 16) bitOr: self instSize
