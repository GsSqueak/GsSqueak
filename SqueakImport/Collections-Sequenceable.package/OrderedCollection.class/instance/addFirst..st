adding
addFirst: newObject 
	"Add newObject to the beginning of the receiver. Answer newObject."

	firstIndex = 1 ifTrue: [ self makeRoomAtFirst ].
	^array at: (firstIndex := firstIndex - 1) put: newObject