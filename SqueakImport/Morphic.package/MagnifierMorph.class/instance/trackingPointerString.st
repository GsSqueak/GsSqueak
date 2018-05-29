menu
trackingPointerString
	"Answer a string describing whether or not I'm currently tracking the pointer."

	^ (trackPointer
		ifTrue: ['<yes>']
		ifFalse: ['<no>']), 'track pointer' translated