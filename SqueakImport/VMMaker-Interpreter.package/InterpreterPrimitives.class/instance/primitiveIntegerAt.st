indexing primitives
primitiveIntegerAt
	"Return the 32bit signed integer contents of a words receiver"

	| index rcvr sz addr value intValue |
	<var: #intValue type: 'int'>
	index := self stackIntegerValue: 0.
	rcvr := self stackValue: 1.
	(objectMemory isIntegerObject: rcvr) ifTrue: [^self success: false].
	(objectMemory isWords: rcvr) ifFalse: [^self success: false].
	sz := objectMemory lengthOf: rcvr.  "number of fields"
	self success: ((index >= 1) and: [index <= sz]).
	self successful ifTrue: [
		addr := rcvr + objectMemory baseHeaderSize - 4 "for zero indexing" + (index * 4).
		value := objectMemory intAt: addr.
		self pop: 2.  "pop rcvr, index"
		"push element value"
		(objectMemory isIntegerValue: value)
			ifTrue: [self pushInteger: value]
			ifFalse: [
				intValue := value. "32 bit int may have been stored in 32 or 64 bit sqInt"
				self push: (self signed32BitIntegerFor: intValue)]. "intValue may be sign extended to 64 bit sqInt"
	].