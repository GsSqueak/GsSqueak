accessing
comment

	^ comment ifNil: [self realClass theNonMetaClass organization classComment ifNil: ['']]