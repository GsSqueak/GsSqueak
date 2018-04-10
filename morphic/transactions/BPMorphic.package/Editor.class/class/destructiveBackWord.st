preferences
destructiveBackWord
	<preference: 'Destructive Back-Word' category: 'Morphic' description: 'Indicates whether the back-word command deletes, or merely selects, the prior word.' type: #Boolean>
	^ DestructiveBackWord
		ifNil: [true]