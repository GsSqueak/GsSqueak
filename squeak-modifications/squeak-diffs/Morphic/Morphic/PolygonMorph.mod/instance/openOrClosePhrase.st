access
openOrClosePhrase
	"Answer a string indicating whether the receiver is open or closed."

	^ (closed ifTrue: ['<yes>'] ifFalse: ['<no>']), 'closed' translated