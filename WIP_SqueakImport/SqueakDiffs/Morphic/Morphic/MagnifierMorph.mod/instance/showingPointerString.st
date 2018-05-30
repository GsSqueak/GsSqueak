menu
showingPointerString
	"Answer a string characterizing whether or not I'm showing the pointer."

	^ (self showPointer 
		ifTrue: ['<yes>']
		ifFalse: ['<no>']), 'show pointer' translated