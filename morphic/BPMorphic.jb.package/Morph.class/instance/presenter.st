accessing
presenter	^ owner		ifNil: [self currentWorld presenter]		ifNotNil: [owner presenter]