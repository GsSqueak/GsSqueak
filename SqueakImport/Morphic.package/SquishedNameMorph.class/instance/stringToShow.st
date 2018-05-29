drawing
stringToShow

	(target isNil or: [getSelector isNil]) ifTrue: [^'????'].
	^target perform: getSelector