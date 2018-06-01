misc
showingPageControlsString
	"Answer a string characterizing whether page controls are currently showing."

	^ (self pageControlsVisible ifTrue: ['<yes>'] ifFalse: ['<no>']),
		'page controls visible' translated