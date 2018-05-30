initialize-release
finalChoice
	"return the chosen directory/filename that was saved by an accept click or nil; client must check for validity"
	^ finalChoice
		ifNotNil: [self directory fullNameFor: finalChoice]