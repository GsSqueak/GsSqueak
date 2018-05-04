system control primitives
primitiveUtcWithOffset
	"Answer an array with UTC microseconds since the Posix epoch and the
	current seconds offset from GMT in the local time zone. An empty two
	element array (or any object with two or more slots) may be supplied
	as a parameter.
	This is a named (not numbered) primitive in the null module (ie the VM)"
	| clock offset resultArray |

	<export: true>
	<var: #clock type: 'sqLong'>
	<var: #offset type: 'int'>
	argumentCount > 1 ifTrue: [^self primitiveFailFor: PrimErrBadNumArgs].
	(self cCode: 'ioUtcWithOffset(&clock, &offset)' inSmalltalk: [-1]) = -1
		ifTrue: [^ self primitiveFail].
	objectMemory pushRemappableOop: (self positive64BitIntegerFor: clock).
	argumentCount > 0
		ifTrue: [resultArray := self popStack.
			((objectMemory isPointers: resultArray)
				and: [(objectMemory lengthOf: resultArray) >= 2])
					ifFalse: [^self primitiveFailFor: PrimErrBadArgument]]
		ifFalse: [resultArray := objectMemory instantiateClass: objectMemory classArray indexableSize: 2].
	objectMemory storePointer: 0 ofObject: resultArray withValue: objectMemory popRemappableOop.
	objectMemory storePointerUnchecked: 1 ofObject: resultArray withValue: (objectMemory integerObjectOf: offset).
	self pop: 1 thenPush: resultArray
