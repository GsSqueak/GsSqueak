utilities
floatValueOf: oop
	"Fetch the instance variable at the given index of the given object. Return the C double precision floating point value of that instance variable, or fail if it is not a Float."
	"Note: May be called by translated primitive code."

	| result |
	<returnTypeC: 'double'>
	<var: #result type: 'double '>
	self flag: #Dan.  "None of the float stuff has been converted for 64 bits"
	self assertClassOf: oop is: (objectMemory splObj: ClassFloat).
	self successful
		ifTrue: [self cCode: '' inSmalltalk: [result := Float new: 2].
				self fetchFloatAt: oop + objectMemory baseHeaderSize into: result]
		ifFalse: [result := 0.0].
	^ result