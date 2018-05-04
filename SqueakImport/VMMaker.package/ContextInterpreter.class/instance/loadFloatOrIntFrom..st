utilities
loadFloatOrIntFrom: floatOrInt
	"If floatOrInt is an integer, then convert it to a C double float and return it.
	If it is a Float, then load its value and return it.
	Otherwise fail -- ie return with primFailCode set."

	<inline: true>
	<returnTypeC: 'double'>

	(objectMemory isIntegerObject: floatOrInt) ifTrue:
		[^ (objectMemory integerValueOf: floatOrInt) asFloat].
	(objectMemory fetchClassOfNonInt: floatOrInt) = (objectMemory splObj: ClassFloat)
		ifTrue: [^ self floatValueOf: floatOrInt].
	self primitiveFail