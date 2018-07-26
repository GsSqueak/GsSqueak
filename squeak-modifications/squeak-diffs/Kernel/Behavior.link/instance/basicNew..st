instance creation
basicNew: anInteger
	"use env0 basicNew:, added in EA 4419"
	<primitive: 1082>

	self isWords ifTrue: [^ self primWordBasicNew: anInteger].
	^ self primNormalBasicNew: anInteger
