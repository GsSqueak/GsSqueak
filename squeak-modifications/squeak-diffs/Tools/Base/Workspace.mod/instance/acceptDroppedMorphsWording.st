drag and drop
acceptDroppedMorphsWording

	^ self acceptsDroppingMorphForReference
		ifTrue: ['<yes> create textual references to dropped morphs' translated]
		ifFalse: ['<no> create textual references to dropped morphs' translated]
