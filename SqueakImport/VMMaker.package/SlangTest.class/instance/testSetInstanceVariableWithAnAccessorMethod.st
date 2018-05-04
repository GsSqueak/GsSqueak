testing intermediate variable removal
testSetInstanceVariableWithAnAccessorMethod
	"Intermediate variable from parameter of accessor method should be removed.
	This is an existing limitation of the inliner, and could be improved for better code
	generation. It is not a bug."

	| stssi s |
	stssi := SlangTestSupportInterpreter inline: true.
	s := (stssi asCString: #setInstanceVariableWithAnAccessorMethod)
			copyReplaceAll: 'setInstanceVariableWithAnAccessorMethod'
			with: 'methodName'.
	self deny: (s includesSubString: 'sqInt oop').
	self assert: (s includesSubString: 'aVariable = remap(').

	"Should be translated to something similar to this:
		aVariable = remap(objectMemory, nilObj);

	Not like this:
		oop = remap(objectMemory, nilObj);
		aVariable = oop;"
