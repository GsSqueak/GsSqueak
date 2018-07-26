accessing
basicAt: index put: value 
	"use env0 squeakBasicAt:put:, added in EA 4419"
	 <primitive: 1080>

	self class isWords ifTrue: [^ self primWordBasicAt: index put: value].
	^ self primNormalBasicAt: index put: value
