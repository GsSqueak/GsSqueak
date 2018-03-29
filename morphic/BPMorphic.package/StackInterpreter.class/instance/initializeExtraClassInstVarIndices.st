initialization
initializeExtraClassInstVarIndices
	"Initialize metaclassNumSlots and thisClassIndex which are used in
	debug printing, and
	classNameIndex which is used not only for debug printing but for
	is:KindOf: & is:MemberOf:
	via classNameOf:is: (evil but a reality we have to accept)."
	| _gsSqueakTemp_classArrayObj _gsSqueakTemp_classArrayClass |
	_gsSqueakTemp_classArrayObj := objectMemory splObj: ClassArray.
	_gsSqueakTemp_classArrayClass := objectMemory fetchClassOfNonImm: _gsSqueakTemp_classArrayObj.
	metaclassNumSlots := objectMemory numSlotsOf: _gsSqueakTemp_classArrayClass.
	"determine actual Metaclass instSize"
	thisClassIndex := 5.
	"default"
	InstanceSpecificationIndex + 1
		to: (objectMemory lengthOf: _gsSqueakTemp_classArrayClass)
		do: [:i | (objectMemory fetchPointer: i - 1 ofObject: _gsSqueakTemp_classArrayClass)
					= _gsSqueakTemp_classArrayObj
				ifTrue: [thisClassIndex := i - 1]].
	classNameIndex := 6.
	"default"
	InstanceSpecificationIndex + 1
		to: (objectMemory lengthOf: _gsSqueakTemp_classArrayObj)
		do: [:i | 
			| oop |
			oop := objectMemory fetchPointer: i - 1 ofObject: _gsSqueakTemp_classArrayObj.
			((objectMemory isBytes: oop)
					and: [(objectMemory lengthOf: oop)
								= 5
							and: [(objectMemory
									str: 'Array'
									n: (objectMemory firstFixedField: oop)
									cmp: 5)
									= 0]])
				ifTrue: [classNameIndex := i - 1]]