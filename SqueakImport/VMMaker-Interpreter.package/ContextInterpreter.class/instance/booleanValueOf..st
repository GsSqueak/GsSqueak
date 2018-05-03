utilities
booleanValueOf: obj
"convert true and false (Smalltalk) to true or false(C)"
	obj = objectMemory getTrueObj ifTrue: [ ^ true ].
	obj = objectMemory getFalseObj ifTrue: [ ^ false ].
	self primitiveFail.
	^ nil