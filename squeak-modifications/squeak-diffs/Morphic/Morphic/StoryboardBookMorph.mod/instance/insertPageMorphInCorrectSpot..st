navigation
insertPageMorphInCorrectSpot: aPageMorph
	"Insert the page morph at the correct spot"
	
	| place |
	place := submorphs size > 1 ifTrue: [submorphs second] ifFalse: [submorphs first].
	"Old architecture had a tiny spacer morph as the second morph; now architecture does not"
	self addMorph: (currentPage := aPageMorph) behind: place.
	self changeTiltFactor: self getTiltFactor.
	self changeZoomFactor: self getZoomFactor.
	zoomController target: currentPage.

