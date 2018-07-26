accessing
basicAt: index 
	"use env0 squeakBasicAt:, added in EA 4419"
	<primitive: 1079>

	self class isWords ifTrue: [^ self primWordBasicAt: index].
	^ self primNormalBasicAt: index
