comparing
= textAttribute
	^ textAttribute class == self class
		and: [textAttribute evalString = evalString]