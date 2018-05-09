conversion
nextFromStream: aStream
	| character1 |
	aStream isBinary ifTrue: [^ aStream basicNext].
	character1 := aStream basicNext ifNil: [^ nil].
	^ self toSqueak: character1