parsing topaz output
convertToBoolean: topazOutput

	topazOutput = 'true' ifTrue: [ ^ true ].
	topazOutput = 'false' ifTrue: [ ^ false ].
	self error: 'expected output to be an integer'