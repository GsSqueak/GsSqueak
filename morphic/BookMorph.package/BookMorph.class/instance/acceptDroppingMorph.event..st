layout
acceptDroppingMorph: aMorph event: evt 
	"Allow the user to add submorphs just by dropping them on this
	morph. "
	(currentPage allMorphs includes: aMorph)
		ifFalse: [currentPage addMorph: aMorph]