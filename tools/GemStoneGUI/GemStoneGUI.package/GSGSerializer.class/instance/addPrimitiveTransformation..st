resolution
addPrimitiveTransformation: type

	self resolveDescription: #Nil.
	self transformations
		at: type
		ifAbsentPut: [self perform: (type , 'Transformation') asSymbol]