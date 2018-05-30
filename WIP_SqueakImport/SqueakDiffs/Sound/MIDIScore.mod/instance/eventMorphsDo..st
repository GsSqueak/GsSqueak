ambient track
eventMorphsDo: aBlock
	"Evaluate aBlock for all morphs related to the ambient events."

	ambientTrack == nil ifTrue: [^ self].
	ambientTrack do: [:evt | evt morph ifNotNil: aBlock].
