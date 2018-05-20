resolution
addPrimitiveTransformation: type

	self transformations
		at: type
		ifAbsentPut: [self perform: (type , 'Transformation') asSymbol]