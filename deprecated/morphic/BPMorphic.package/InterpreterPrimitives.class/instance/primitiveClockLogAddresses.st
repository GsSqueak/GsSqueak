system control primitives
primitiveClockLogAddresses
	"Take a boolean which if true turns or keeps clock logging on. Answer
	an array supplying
	the size of the clock logs, the address of the usecs log, the index in it,
	the address of the
	msecs log, and the index into it."
	| _gsSqueakTemp_result _gsSqueakTemp_runInNOut _gsSqueakTemp_usecs _gsSqueakTemp_uidx _gsSqueakTemp_msecs _gsSqueakTemp_midx _gsSqueakTemp_v1 _gsSqueakTemp_v2 |
	"bypass type inference which would deduce int"
	argumentCount ~= 1
		ifTrue: [^ self primitiveFail].
	_gsSqueakTemp_runInNOut := (self stackValue: 0)
				== objectMemory trueObject.
	self
		ioGetClockLogSize: (self addressOf: _gsSqueakTemp_runInNOut)
		Usecs: (self addressOf: _gsSqueakTemp_usecs)
		Idx: (self addressOf: _gsSqueakTemp_uidx)
		Msecs: (self addressOf: _gsSqueakTemp_msecs)
		Idx: (self addressOf: _gsSqueakTemp_midx).
	_gsSqueakTemp_result := objectMemory
				instantiateClass: (objectMemory splObj: ClassArray)
				indexableSize: 5.
	_gsSqueakTemp_result = 0
		ifTrue: [^ self primitiveFail].
	objectMemory pushRemappableOop: _gsSqueakTemp_result.
	objectMemory
		storePointerUnchecked: 0
		ofObject: objectMemory topRemappableOop
		withValue: (objectMemory integerObjectOf: _gsSqueakTemp_runInNOut).
	_gsSqueakTemp_v1 := self positive32BitIntegerFor: _gsSqueakTemp_usecs asUnsignedInteger.
	_gsSqueakTemp_v2 := self positive32BitIntegerFor: _gsSqueakTemp_msecs asUnsignedInteger.
	self successful
		ifFalse: [objectMemory popRemappableOop.
			^ self primitiveFail].
	objectMemory
		storePointer: 1
		ofObject: objectMemory topRemappableOop
		withValue: _gsSqueakTemp_v1.
	objectMemory
		storePointerUnchecked: 2
		ofObject: objectMemory topRemappableOop
		withValue: (objectMemory integerObjectOf: _gsSqueakTemp_uidx).
	objectMemory
		storePointer: 3
		ofObject: objectMemory topRemappableOop
		withValue: _gsSqueakTemp_v2.
	objectMemory
		storePointerUnchecked: 4
		ofObject: objectMemory topRemappableOop
		withValue: (objectMemory integerObjectOf: _gsSqueakTemp_midx).
	self pop: 2 thenPush: objectMemory popRemappableOop