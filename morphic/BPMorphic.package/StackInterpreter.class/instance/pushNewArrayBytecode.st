stack bytecodes
pushNewArrayBytecode
	| _gsSqueakTemp_size _gsSqueakTemp_popValues _gsSqueakTemp_array |
	_gsSqueakTemp_size := self fetchByte.
	_gsSqueakTemp_popValues := _gsSqueakTemp_size > 127.
	_gsSqueakTemp_size := _gsSqueakTemp_size bitAnd: 127.
	self fetchNextBytecode.
	self externalizeIPandSP.
	"in case of abort"
	objectMemory hasSpurMemoryManagerAPI
		ifTrue: [_gsSqueakTemp_array := objectMemory
						eeInstantiateSmallClassIndex: ClassArrayCompactIndex
						format: objectMemory arrayFormat
						numSlots: _gsSqueakTemp_size]
		ifFalse: [_gsSqueakTemp_array := objectMemory
						eeInstantiateClassIndex: ClassArrayCompactIndex
						format: objectMemory arrayFormat
						numSlots: _gsSqueakTemp_size].
	_gsSqueakTemp_popValues
		ifTrue: [0
				to: _gsSqueakTemp_size - 1
				do: [:i | "Assume: have just allocated a new Array; it must be
					young. Thus, can use unchecked stores."
					objectMemory
						storePointerUnchecked: i
						ofObject: _gsSqueakTemp_array
						withValue: (self internalStackValue: _gsSqueakTemp_size - i - 1)].
			self internalPop: _gsSqueakTemp_size]
		ifFalse: [0
				to: _gsSqueakTemp_size - 1
				do: [:i | objectMemory
						storePointerUnchecked: i
						ofObject: _gsSqueakTemp_array
						withValue: objectMemory nilObject]].
	self internalPush: _gsSqueakTemp_array