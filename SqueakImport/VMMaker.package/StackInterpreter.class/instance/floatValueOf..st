utilities
floatValueOf: oop
	"Fetch the instance variable at the given index of the given object. Return the C double precision floating point value of that instance variable, or fail if it is not a Float."
	"Note: May be called by translated primitive code."

	| result |
	<returnTypeC: #double>
	<var: #result type: #double>
	self flag: #Dan.  "None of the float stuff has been converted for 64 bits"
	"N.B.  Because Slang always inlines assertClassOf:is:compactClassIndex:
	 (because assertClassOf:is:compactClassIndex: has an inline: pragma) the
	 phrase (self splObj: ClassArray) is expanded in-place and is _not_
	 evaluated if ClassArrayCompactIndex is non-zero."
	self assertClassOf: oop
		is: (objectMemory splObj: ClassFloat)
		compactClassIndex: ClassFloatCompactIndex.
	self successful ifTrue:
		[self cCode: '' inSmalltalk: [result := Float new: 2].
		objectMemory fetchFloatAt: oop + objectMemory baseHeaderSize into: result.
		^result].
	^0.0