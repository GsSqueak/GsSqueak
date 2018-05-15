reading
processEndTag: aTag

	| index tagName |
	index := count - offset.
	tagName := aTag copyFrom: 3 to: aTag size - 1.

	(self isTagIgnored: tagName) ifTrue: [^ self].
	
	tagName = 'code' ifTrue: [self mapCloseCodeTag].
	tagName = 'pre' ifTrue: [self breakLines: true].
		
	self processRunStackTop.

	runStack pop.
	runStack top at: 2 put: index + 1.