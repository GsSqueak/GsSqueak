dependency sorting
requirements

	self isLinked
		ifTrue: [ ^ self linkedRequirements ]
		ifFalse: [ ^ self nonLinkedRequirements ]
