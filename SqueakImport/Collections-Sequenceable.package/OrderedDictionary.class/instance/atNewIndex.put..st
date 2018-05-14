private
atNewIndex: index put: anObject

	super atNewIndex: index put: anObject.
	order at: tally put: anObject
	