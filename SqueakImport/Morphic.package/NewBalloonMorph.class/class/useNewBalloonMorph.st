preferences
useNewBalloonMorph

	<preference: 'Use new-style help balloon morphs'
		category: #Morphic
		description: 'The new-style help balloon morphs are improved for better reading quality and support rich text.'
		type: #Boolean>
	^ UseNewBalloonMorph ifNil: [true]