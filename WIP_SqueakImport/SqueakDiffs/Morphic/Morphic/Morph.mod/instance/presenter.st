accessing
presenter
	^ owner ifNotNil: [owner presenter] ifNil: [self currentWorld presenter]