stack bytecodes
popFloat
	"Note: May be called by translated primitive code."

	| top result |
	<returnTypeC: 'double'>
	<var: #result type: 'double '>
	top := self popStack.
	self assertClassOf: top is: (objectMemory splObj: ClassFloat).
	self successful ifTrue:
		[self cCode: '' inSmalltalk: [result := Float new: 2].
		self fetchFloatAt: top + objectMemory baseHeaderSize into: result].
	^ result