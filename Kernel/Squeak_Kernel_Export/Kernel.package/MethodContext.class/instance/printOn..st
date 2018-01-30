printing
printOn: aStream

	self outerContext
		ifNil: [super printOn: aStream]
		ifNotNil:
			[:outerContext|
			 aStream nextPutAll: '[] in '.
			 outerContext printOn: aStream]