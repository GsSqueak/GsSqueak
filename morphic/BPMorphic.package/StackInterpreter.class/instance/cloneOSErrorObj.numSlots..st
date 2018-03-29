message sending
cloneOSErrorObj: errObj numSlots: numSlots 
	"If errObj is a pointer object with at least two slots, then answer a clone
	of the error object with the second slot set to the value of
	osErrorCode. "
	| _gsSqueakTemp_clone |
	_gsSqueakTemp_clone := objectMemory hasSpurMemoryManagerAPI
				ifTrue: [objectMemory
						eeInstantiateSmallClassIndex: (objectMemory classIndexOf: errObj)
						format: objectMemory nonIndexablePointerFormat
						numSlots: numSlots]
				ifFalse: [objectMemory
						eeInstantiateSmallClass: (objectMemory fetchClassOfNonImm: errObj)
						numSlots: numSlots].
	0
		to: numSlots - 1
		do: [:i | objectMemory
				storePointerUnchecked: i
				ofObject: _gsSqueakTemp_clone
				withValue: (objectMemory fetchPointer: i ofObject: errObj)].
	objectMemory
		storePointerUnchecked: 1
		ofObject: _gsSqueakTemp_clone
		withValue: (self signed64BitIntegerFor: osErrorCode).
	^ _gsSqueakTemp_clone