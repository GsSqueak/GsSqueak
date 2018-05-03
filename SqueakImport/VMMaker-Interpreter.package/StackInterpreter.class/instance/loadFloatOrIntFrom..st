utilities
loadFloatOrIntFrom: floatOrInt
	"If floatOrInt is an integer, then convert it to a C double float and return it.
	If it is a Float, then load its value and return it.
	Otherwise fail -- ie return with primErrorCode non-zero."

	| result |
	<inline: true>
	<asmLabel: false>
	<returnTypeC: #double>
	<var: #result type: #double>

	(objectMemory isIntegerObject: floatOrInt) ifTrue:
		[^(objectMemory integerValueOf: floatOrInt) asFloat].
	self assertClassOf: floatOrInt
		is: (objectMemory splObj: ClassFloat)
		compactClassIndex: ClassFloatCompactIndex.
	self cCode: '' inSmalltalk: [result := Float new: 2].
	self successful ifTrue:
		[objectMemory fetchFloatAt: floatOrInt + objectMemory baseHeaderSize into: result].
	^result