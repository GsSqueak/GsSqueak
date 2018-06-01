mapping
mapAlignmentValue: aString

	(aString = 'center' or: [aString = 'middle']) ifTrue: [^ {TextAlignment centered}].
	aString = 'left' ifTrue: [^ {TextAlignment leftFlush}].
	aString = 'right' ifTrue: [^ {TextAlignment rightFlush}].
	aString = 'justify'  ifTrue: [^ {TextAlignment justified}].
	^ #()