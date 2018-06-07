file in/out
restoreReferences

	| refs newPool |
	refs := world valueOfProperty: #References ifAbsent: [nil].
	(refs isMemberOf: OrderedCollection) ifTrue: [
		world removeProperty: #References.
		newPool := world referencePool.
		refs do: [:assoc | newPool add: assoc].
	].
