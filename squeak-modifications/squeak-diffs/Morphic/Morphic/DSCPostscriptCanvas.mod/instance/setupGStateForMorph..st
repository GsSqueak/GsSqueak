morph drawing
setupGStateForMorph: aMorph 
	"position the morph on the page "
	morphLevel
			== (topLevelMorph pagesHandledAutomatically
					ifTrue: [2]
					ifFalse: [1])
		ifTrue:  [ self writePageSetupFor: aMorph ]