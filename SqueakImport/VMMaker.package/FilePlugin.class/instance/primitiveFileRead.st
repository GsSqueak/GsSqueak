file primitives
primitiveFileRead
	<export: true>
	"self cppIf: SPURVM"
	self isDefined: 'SPURVM'
		inSmalltalk: [ self primitiveFileReadWithoutPinning ]
		comment: 'use primitiveFileReadWithPinning for SPUR'
		ifTrue: [self primitiveFileReadWithPinning]
		ifFalse: [self primitiveFileReadWithoutPinning]