image segment in/out
oopHasAcceptableClass: signedOop
	"Similar to oopHasOkayClass:, except that it only returns true or false."

	| oopClass formatMask behaviorFormatBits oopFormatBits oop |
	<var: #oop type: 'usqInt'>
	<var: #oopClass type: 'usqInt'>

	(self isIntegerObject: signedOop) ifTrue: [^ true].

	oop := self cCoerce: signedOop to: 'usqInt'.

	oop < endOfMemory ifFalse: [^ false].
	((oop \\ self bytesPerWord) = 0) ifFalse: [^ false].
	(oop + (self sizeBitsOf: oop)) < endOfMemory ifFalse: [^ false].
	oopClass := self cCoerce: (self fetchClassOf: oop) to: 'usqInt'.

	(self isIntegerObject: oopClass) ifTrue: [^ false].
	(oopClass < endOfMemory) ifFalse: [^ false].
	((oopClass \\ self bytesPerWord) = 0) ifFalse: [^ false].
	(oopClass + (self sizeBitsOf: oopClass)) < endOfMemory ifFalse: [^ false].
	((self isPointers: oopClass) and: [(self lengthOf: oopClass) >= 3]) ifFalse: [^ false].
	(self isBytes: oop)
		ifTrue: [ formatMask := 16rC00 ]  "ignore extra bytes size bits"
		ifFalse: [ formatMask := 16rF00 ].

	behaviorFormatBits := (self formatOfClass: oopClass) bitAnd: formatMask.
	oopFormatBits := (self baseHeader: oop) bitAnd: formatMask.
	behaviorFormatBits = oopFormatBits ifFalse: [^ false].
	^ true