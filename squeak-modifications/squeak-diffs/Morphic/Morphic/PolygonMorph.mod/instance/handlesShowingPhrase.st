menu
handlesShowingPhrase
	"Answer a phrase characterizing whether handles are showing or not."

	^ (self showingHandles ifTrue: ['<yes>'] ifFalse: ['<no>']), ('show handles' translated)