system primitives
rootStubInImageSegment: imageSegment

	^ ImageSegmentRootStub new
		xxSuperclass: nil
		format: nil
		segment: imageSegment