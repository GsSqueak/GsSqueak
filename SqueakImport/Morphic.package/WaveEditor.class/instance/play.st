menu
play

	graph data size < 2 ifTrue: [^ self].
	(SampledSound samples: graph data samplingRate: samplingRate) play.

