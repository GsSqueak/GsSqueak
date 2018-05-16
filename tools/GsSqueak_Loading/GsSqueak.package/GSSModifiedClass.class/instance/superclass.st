accessing
superclass

	^ superclass ifNil: [self realClass superclass theNonMetaClass name]