plugin primitive support
isFloatObject: oop
	^(objectMemory fetchClassOf: oop) == objectMemory classFloat