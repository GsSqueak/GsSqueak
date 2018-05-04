indexing primitives
primitiveIntegerAtPut
	"Return the 32bit signed integer contents of a words receiver"
	| index rcvr sz addr value valueOop |
	valueOop := self stackValue: 0.
	index := self stackIntegerValue: 1.
	rcvr := self stackValue: 2.
	(objectMemory isIntegerObject: rcvr) ifTrue:[^self success: false].
	(objectMemory isWords: rcvr) ifFalse:[^self success: false].
	sz := objectMemory lengthOf: rcvr.  "number of fields"
	((index >= 1) and: [index <= sz]) ifFalse:[^self success: false].
	(objectMemory isIntegerObject: valueOop)
		ifTrue:[value := objectMemory integerValueOf: valueOop]
		ifFalse:[value := objectMemory signed32BitValueOf: valueOop].
	self successful ifTrue:[
		addr := rcvr + objectMemory baseHeaderSize - 4 "for zero indexing" + (index * 4).
		value := objectMemory intAt: addr put: value.
		self pop: 3 thenPush: valueOop. "pop all; return value"
	].
