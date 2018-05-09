as yet unclassified
printOn: aStream forLisp: aLisp 
	| ds |
	ds := self depth.
	ds := ds isZero
				ifTrue: ['top']
				ifFalse: [ds asString].
	aStream nextPutAll: '#<env.frame (' , ds , ')>'