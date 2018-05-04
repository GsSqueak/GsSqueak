image segment in/out
oopHasAcceptableClass: signedOop
	"Similar to oopHasOkayClass:, except that it only returns true or false."

	| oopClass formatMask behaviorFormatBits oopFormatBits oop |
	<var: #oop type: #usqInt>
	<var: #oopClass type: #usqInt>

	(self isIntegerObject: signedOop) ifTrue: [^ true].

	oop := self cCoerce: signedOop to: #usqInt.

	oop < freeStart ifFalse: [^ false].
	((oop \\ self bytesPerWord) = 0) ifFalse: [^ false].
	(oop + (self sizeBitsOf: oop)) <= freeStart ifFalse: [^ false].
	oopClass := self cCoerce: (self fetchClassOfNonInt: oop) to: #usqInt.

	(self isIntegerObject: oopClass) ifTrue: [^ false].
	(oopClass < freeStart) ifFalse: [^ false].
	((oopClass \\ self bytesPerWord) = 0) ifFalse: [^ false].
	(oopClass + (self sizeBitsOf: oopClass)) <= freeStart ifFalse: [^ false].
	((self isPointersNonInt: oopClass) and: [(self lengthOf: oopClass) >= 3]) ifFalse: [^ false].
	formatMask := (self isBytesNonInt: oop)
						ifTrue: [16rC00]  "ignore extra bytes size bits"
						ifFalse: [16rF00].

	behaviorFormatBits := (self formatOfClass: oopClass) bitAnd: formatMask.
	oopFormatBits := (self baseHeader: oop) bitAnd: formatMask.
	behaviorFormatBits = oopFormatBits ifFalse: [^ false].
	^ true