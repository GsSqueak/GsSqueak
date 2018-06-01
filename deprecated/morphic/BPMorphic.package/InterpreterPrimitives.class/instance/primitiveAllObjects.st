object access primitives
primitiveAllObjects
	"Answer an array of all objects that exist when the primitive
	is called, excluding those that may be garbage collected as
	a side effect of allocating the result array."
	| _gsSqueakTemp_result |
	_gsSqueakTemp_result := objectMemory allObjects.
	(objectMemory isIntegerObject: _gsSqueakTemp_result)
		ifTrue: [objectMemory
				growToAccomodateContainerWithNumSlots: (objectMemory integerValueOf: _gsSqueakTemp_result).
			_gsSqueakTemp_result := objectMemory allObjects.
			(objectMemory isIntegerObject: _gsSqueakTemp_result)
				ifTrue: [^ self primitiveFailFor: PrimErrNoMemory]].
	self pop: argumentCount + 1 thenPush: _gsSqueakTemp_result