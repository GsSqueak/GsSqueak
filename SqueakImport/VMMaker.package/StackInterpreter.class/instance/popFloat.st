stack bytecodes
popFloat
	"Note: May be called by translated primitive code."

	| top result |
	<returnTypeC: #double>
	<var: #result type: #double>
	top := self popStack.
	"N.B.  Because Slang always inlines assertClassOf:is:compactClassIndex:
	 (because assertClassOf:is:compactClassIndex: has an inline: pragma) the
	 phrase (self splObj: ClassArray) is expanded in-place and is _not_
	 evaluated if ClassArrayCompactIndex is non-zero."
	self assertClassOf: top
		is: (objectMemory splObj: ClassFloat)
		compactClassIndex: ClassFloatCompactIndex.
	self successful ifTrue:
		[self cCode: '' inSmalltalk: [result := Float new: 2].
		objectMemory fetchFloatAt: top + objectMemory baseHeaderSize into: result].
	^ result