contexts
storeStackPointerValue: value inContext: contextPointer
	"Assume: value is an integerValue"

	objectMemory storePointerUnchecked: StackPointerIndex ofObject: contextPointer
		withValue: (objectMemory integerObjectOf: value).