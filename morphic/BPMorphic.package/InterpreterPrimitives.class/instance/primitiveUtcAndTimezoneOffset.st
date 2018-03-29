system control primitives
primitiveUtcAndTimezoneOffset
	"Answer an array with UTC microseconds since the Smalltalk epoch
	and the
	current seconds offset from GMT in the local time zone. Any pointer
	object with two or more slots) may be supplied as a parameter."
	| _gsSqueakTemp_resultArray |
	argumentCount > 0
		ifTrue: [argumentCount > 1
				ifTrue: [^ self primitiveFailFor: PrimErrBadNumArgs].
			_gsSqueakTemp_resultArray := self stackTop.
			((objectMemory isPointers: _gsSqueakTemp_resultArray)
					and: [(objectMemory lengthOf: _gsSqueakTemp_resultArray)
							>= 2])
				ifFalse: [^ self primitiveFailFor: PrimErrBadArgument]]
		ifFalse: [_gsSqueakTemp_resultArray := objectMemory instantiateClass: objectMemory classArray indexableSize: 2].
	"N.B. No pushRemappableOop:/popRemappableOop in Cog because
	positive64BitIntegerFor: et al use
	eeInstantiate... allocators which are guaranteed not to do a GC."
	objectMemory
		storePointerUnchecked: 1
		ofObject: _gsSqueakTemp_resultArray
		withValue: (objectMemory integerObjectOf: self ioLocalSecondsOffset);
		
		storePointer: 0
		ofObject: _gsSqueakTemp_resultArray
		withValue: (self positive64BitIntegerFor: self ioUTCMicroseconds).
	self pop: argumentCount + 1 thenPush: _gsSqueakTemp_resultArray