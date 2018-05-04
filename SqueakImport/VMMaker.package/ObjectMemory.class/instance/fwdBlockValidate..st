gc -- compaction
fwdBlockValidate: addr 
	"Raise an error if the given address is not a valid forward table entry."
	((self oop: addr isGreaterThan: endOfMemory)
			and: [(self oop: addr isLessThanOrEqualTo: fwdTableNext)
					and: [(addr bitAnd: 3) = 0]])
		ifFalse: [self error: 'invalid fwd table entry']