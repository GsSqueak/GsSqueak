accessing
itemEnvironment
	^ environment at: self class environmentKind ifAbsent: [Smalltalk globals].