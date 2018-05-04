object enumeration
instanceAfter: objectPointer 
	"Support for instance enumeration. Return the next instance 
	of the class of the given object, or nilObj if the enumeration 
	is complete."
	| classPointer thisObj thisClass |
	classPointer := self fetchClassOf: objectPointer.
	thisObj := self accessibleObjectAfter: objectPointer.
	[thisObj = nil]
		whileFalse: [thisClass := self fetchClassOf: thisObj.
			thisClass = classPointer ifTrue: [^ thisObj].
			thisObj := self accessibleObjectAfter: thisObj].
	^ nilObj