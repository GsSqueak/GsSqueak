object access primitives
primitiveAllObjects
	"Answer an array of all objects that exist when the primitive
	 is called, excluding those that may be garbage collected as
	 a side effect of allocating the result array."

	<export: true>
	| result |
	result := objectMemory allObjects.
	result = 0 ifTrue:
		[^self primitiveFailFor: PrimErrNoMemory].
	self pop: argumentCount+1 thenPush: result