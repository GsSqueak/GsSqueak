contexts
stackFloatValue: offset
	"Note: May be called by translated primitive code."
	| result floatPointer |
	<returnTypeC: 'double'>
	<var: #result type: 'double '>
	floatPointer := objectMemory longAt: stackPointer - (offset * objectMemory bytesPerWord).
	(objectMemory fetchClassOf: floatPointer) = (objectMemory splObj: ClassFloat) 
		ifFalse:[self primitiveFail. ^0.0].
	self cCode: '' inSmalltalk: [result := Float new: 2].
	self fetchFloatAt: floatPointer + objectMemory baseHeaderSize into: result.
	^ result