initialization
initializeExtraClassInstVarIndices
	"Initialize metaclassSizeBytes and thisClassIndex which are used in debug printing, and
	 classNameIndex which is used not only for debug printing but for is:KindOf: & is:MemberOf:
	 via classNameOf:is: (evil but a reality we have to accept)."
	| classArrayObj classArrayClass |
	classNameIndex := 6. "default"
	thisClassIndex := 5. "default"
	classArrayObj := objectMemory splObj: ClassArray.
	classArrayClass := objectMemory fetchClassOfNonInt: classArrayObj.
	metaclassSizeBytes := objectMemory sizeBitsOf: classArrayClass.	"determine actual (Metaclass instSize * 4)"
	InstanceSpecificationIndex + 1 to: (objectMemory lengthOf: classArrayClass) do:
		[:i|
		(objectMemory fetchPointer: i ofObject: classArrayClass) = classArrayObj ifTrue:
			[thisClassIndex := i]].
	InstanceSpecificationIndex + 1 to: (objectMemory lengthOf: classArrayObj) do:
		[:i| | oop |
		oop := objectMemory fetchPointer: i ofObject: classArrayObj.
		((objectMemory isBytes: oop)
		and: [(objectMemory lengthOf: oop) = 5
		and: [(self str: 'Array' n: (objectMemory firstFixedField: oop) cmp: 5) = 0]]) ifTrue:
			[classNameIndex := i]]