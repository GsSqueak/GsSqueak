world state
specialNameInModelFor: aMorph
	^ model ifNotNil: [model nameFor: aMorph] ifNil: [nil]