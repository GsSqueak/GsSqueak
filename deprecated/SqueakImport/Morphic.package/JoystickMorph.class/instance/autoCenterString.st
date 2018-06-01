menu
autoCenterString
	"Answer a string characterizing whether or not I have auto-center on"

	^ (autoCenter == true	ifTrue: ['<yes>'] ifFalse: ['<no>']), ('auto-center' translated)