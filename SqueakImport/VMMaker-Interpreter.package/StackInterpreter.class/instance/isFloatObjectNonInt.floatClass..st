internal interpreter access
isFloatObjectNonInt: oop floatClass: floatClass
	^ClassFloatCompactIndex ~= 0
		ifTrue: [(objectMemory compactClassIndexOf: oop) = ClassFloatCompactIndex]
		ifFalse: [(objectMemory fetchClassOfNonInt: oop) = floatClass]