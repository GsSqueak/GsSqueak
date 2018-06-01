utility
modalLoopOn: aMorph
	[aMorph world notNil] whileTrue: [
		aMorph outermostWorldMorph doOneCycle.
	].