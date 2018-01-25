printing
printPrimitiveOn: aStream
	"Print the primitive on aStream"
	| primIndex primDecl |
	(primIndex := self primitive) = 0 ifTrue:
		[^self].
	primIndex = 120 ifTrue: "External call spec"
		[^aStream print: (self literalAt: 1); cr].
	aStream nextPutAll: '<primitive: '.
	primIndex = 117
		ifTrue:
			[primDecl := self literalAt: 1.
			 (primDecl at: 2) asString printOn: aStream.
			 (primDecl at: 1) ifNotNil:
				[:moduleName|
				aStream nextPutAll:' module: '.
				moduleName asString printOn: aStream]]
		ifFalse:
			[aStream print: primIndex].
	self primitiveErrorVariableName ifNotNil:
		[:primitiveErrorVariableName|
		 aStream nextPutAll: ' error: '; nextPutAll: primitiveErrorVariableName].
	aStream nextPut: $>; cr