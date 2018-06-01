morph drawing
endGStateForMorph: aMorph 
	"position the morph on the page "
	morphLevel
			== (topLevelMorph pagesHandledAutomatically
					ifTrue: [2]
					ifFalse: [1])
		ifTrue:  [ target showpage; print: 'grestore'; cr  ]