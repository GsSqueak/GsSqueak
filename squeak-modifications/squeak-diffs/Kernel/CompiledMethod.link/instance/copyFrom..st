copying
copyFrom: anotherObject
	"Copy to myself all instance variables I have in common with anotherObject.
	 This is dangerous because it ignores an object's control over its own inst vars."

	<primitive: 168>
	anotherObject isCompiledMethod
		ifTrue:
			[1 to: self numLiterals do:
				[:i| self literalAt: i put: (anotherObject literalAt: i)]]
		ifFalse:
			[1 to: self numLiterals do:
				[:i| self literalAt: i put: (anotherObject at: i)]].
	self initialPC to: (self basicSize min: anotherObject basicSize) do:
		[:i|
		 self basicAt: i put: (anotherObject basicAt: i)]