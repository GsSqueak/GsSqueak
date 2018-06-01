as yet unclassified
orientationString
	^ (self orientedVertically
		ifTrue: ['<yes>']
		ifFalse: ['<no>'])
		, 'vertical orientation' translated