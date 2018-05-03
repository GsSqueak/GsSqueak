internal interpreter access
stackFloatValue: offset
	"In the StackInterpreter stacks grow down."
	| result floatPointer |
	<returnTypeC: #double>
	<var: #result type: #double>
	floatPointer := stackPages longAt: stackPointer + (offset * objectMemory bytesPerWord).

	"N.B.  Because Slang always inlines assertClassOf:is:compactClassIndex:
	 (because assertClassOf:is:compactClassIndex: has an inline: pragma) the
	 phrase (self splObj: ClassArray) is expanded in-place and is _not_
	 evaluated if ClassArrayCompactIndex is non-zero."
	self assertClassOf: floatPointer
		is: (objectMemory splObj: ClassFloat)
		compactClassIndex: ClassFloatCompactIndex.
	self successful ifTrue:
		[self cCode: '' inSmalltalk: [result := Float new: 2].
		objectMemory fetchFloatAt: floatPointer + objectMemory baseHeaderSize into: result.
		^result].
	^0.0