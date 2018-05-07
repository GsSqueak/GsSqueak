as yet unclassified
outerContext
	"Answer the context within which the receiver is nested."
	^closureOrNil ifNotNil:
		"the context of the "
		[self sender outerContext]
