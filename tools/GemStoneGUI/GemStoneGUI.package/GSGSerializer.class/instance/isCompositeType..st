testing
isCompositeType: type

	| compositeClass |
	compositeClass := self environment classNamed: type.
	compositeClass ifNil: [^ false].
	^ (compositeClass respondsTo: #compositeStructureForSpec:)
		and: (compositeClass respondsTo: #CompositeTransformation)