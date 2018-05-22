displaying
imageForm
	^self imageFormOfSize: Display extent
		depth: (displayDepth ifNil:[Display depth])