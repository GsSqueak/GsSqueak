ambient track
eventMorphsWithTimeDo: aBlock
	"Evaluate aBlock for all morphs and times related to the ambient events."

	ambientTrack == nil ifTrue: [^ self].
	ambientTrack do: [:evt | evt morph ifNotNil: [aBlock value: evt morph value: evt time]].
