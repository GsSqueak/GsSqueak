header access
isClassOfNonImm: oop equalTo: classOop compactClassIndex: compactClassIndex
	"Answer if the given (non-immediate) object is an instance of the given class
	 that may have a compactClassIndex (if compactClassIndex is non-zero).
	 N.B. Inlining and/or compiler optimization should result in classOop not being
	 accessed if compactClassIndex is non-zero."

	| ccIndex |
	<inline: true>
	<asmLabel: false>
	self assert: (self isIntegerObject: oop) not.

	ccIndex := self compactClassIndexOf: oop.
	^compactClassIndex = 0
		ifTrue:
			[ccIndex = 0
				ifTrue: [((self classHeader: oop) bitAnd: self allButTypeMask) = classOop]
				ifFalse: [false]]
		ifFalse:
			[compactClassIndex == ccIndex]