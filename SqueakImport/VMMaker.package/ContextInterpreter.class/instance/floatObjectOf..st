object format
floatObjectOf: aFloat
	| newFloatObj |
	<var: #aFloat type: 'double '>
self flag: #Dan.
	newFloatObj := objectMemory instantiateSmallClass: (objectMemory splObj: ClassFloat) sizeInBytes: 8 + objectMemory baseHeaderSize.
	self storeFloatAt: newFloatObj + objectMemory baseHeaderSize from: aFloat.
	^ newFloatObj.
