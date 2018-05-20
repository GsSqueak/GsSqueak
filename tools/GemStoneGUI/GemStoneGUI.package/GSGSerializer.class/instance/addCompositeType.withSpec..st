resolution
addCompositeType: type withSpec: spec

	| compositeStructure compositeClass |
	compositeClass := self environment classNamed: type.
	compositeStructure := compositeClass compositeStructureForSpec: spec.
	self addPrimitiveType: #Composite withSpec: compositeStructure.
	self composites 
			at: (Array with: type with: spec)
			ifAbsentPut: [compositeStructure].
	self transformations
			at: type
			ifAbsentPut: [compositeClass CompositeTransformation]