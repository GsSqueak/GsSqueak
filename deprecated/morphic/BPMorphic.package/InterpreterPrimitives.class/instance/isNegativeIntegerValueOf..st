primitive support
isNegativeIntegerValueOf: oop 
	"Answer true if integer object is negative.
	Fail if object pointed by oop i not an integer."
	| _gsSqueakTemp_ok _gsSqueakTemp_smallInt |
	(objectMemory isIntegerObject: oop)
		ifTrue: [_gsSqueakTemp_smallInt := objectMemory integerValueOf: oop.
			^ _gsSqueakTemp_smallInt < 0].
	(objectMemory isNonIntegerNonImmediate: oop)
		ifTrue: [_gsSqueakTemp_ok := objectMemory
						isClassOfNonImm: oop
						equalTo: (objectMemory splObj: ClassLargePositiveInteger)
						compactClassIndex: ClassLargePositiveIntegerCompactIndex.
			_gsSqueakTemp_ok
				ifTrue: [^ false].
			_gsSqueakTemp_ok := objectMemory
						isClassOfNonImm: oop
						equalTo: (objectMemory splObj: ClassLargeNegativeInteger)
						compactClassIndex: ClassLargeNegativeIntegerCompactIndex.
			_gsSqueakTemp_ok
				ifTrue: [^ true]].
	self primitiveFail.
	^ false