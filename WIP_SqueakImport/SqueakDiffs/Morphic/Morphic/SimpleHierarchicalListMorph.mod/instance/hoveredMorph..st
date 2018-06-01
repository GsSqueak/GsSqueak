accessing
hoveredMorph: aMorph

	hoveredMorph == aMorph ifTrue: [^ self].
	
	hoveredMorph ifNotNil: [:m | m changed].
	hoveredMorph := aMorph.
	hoveredMorph ifNotNil: [:m | m changed].	