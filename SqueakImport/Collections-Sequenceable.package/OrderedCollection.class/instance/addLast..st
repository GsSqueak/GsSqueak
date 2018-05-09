adding
addLast: newObject 
	"Add newObject to the end of the receiver. Answer newObject."

	array size = lastIndex ifTrue: [ self makeRoomAtLast ].
	^array at: (lastIndex := lastIndex + 1) put: newObject