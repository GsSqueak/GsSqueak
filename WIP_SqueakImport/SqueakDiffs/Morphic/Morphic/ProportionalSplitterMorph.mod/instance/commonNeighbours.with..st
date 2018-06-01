controlled morphs
commonNeighbours: morphs with: aProportionalSplitterMorphOrNil
	"Answer the subset of morphs which is also confined by aProportionalSplitterMorphOrNil."

	^ aProportionalSplitterMorphOrNil isNil
		ifTrue: [morphs]
		ifFalse: [morphs select: [ :which |
				aProportionalSplitterMorphOrNil bordersOn: which]]