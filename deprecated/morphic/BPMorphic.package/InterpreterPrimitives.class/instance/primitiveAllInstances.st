object access primitives
primitiveAllInstances
	"Answer an array of all instances of the receiver that exist
	when the primitive is called, excluding any that may be
	garbage collected as a side effect of allocating the result array."
	| _gsSqueakTemp_result |
	NewspeakVM
		ifTrue: ["For the mirror prims check that the class obj is actually a valid
			class. "
			(argumentCount < 1
					or: [(objectMemory isNonImmediate: self stackTop)
							and: [self objCouldBeClassObj: self stackTop]])
				ifFalse: [^ self primitiveFailFor: PrimErrBadArgument]].
	_gsSqueakTemp_result := objectMemory allInstancesOf: self stackTop.
	(objectMemory isIntegerObject: _gsSqueakTemp_result)
		ifTrue: [objectMemory
				growToAccomodateContainerWithNumSlots: (objectMemory integerValueOf: _gsSqueakTemp_result).
			_gsSqueakTemp_result := objectMemory allInstancesOf: self stackTop.
			(objectMemory isIntegerObject: _gsSqueakTemp_result)
				ifTrue: [^ self primitiveFailFor: PrimErrNoMemory]].
	self pop: argumentCount + 1 thenPush: _gsSqueakTemp_result