tests - basic
testRange
	self assert: SmallInteger maxVal class equals: SmallInteger.
	self assert: (SmallInteger maxVal + 1) class equals: LargePositiveInteger.
	self assert: SmallInteger minVal class equals: SmallInteger.
	self assert: (SmallInteger minVal - 1) class equals: LargeNegativeInteger