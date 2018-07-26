accessing
basicSize
	"use env0 squeakBasicSize, added in EA 4419"
        <primitive: 1081>

	self class isWords ifTrue: [^ self primWordBasicSize].
	^ self primNormalBasicSize
