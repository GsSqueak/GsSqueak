*SqClasses-accessing method dictionary
rootStubInImageSegment: imageSegment 

	^ ImageSegmentRootStub new
		xxSuperclass: superclass
		format: format
		segment: imageSegment
