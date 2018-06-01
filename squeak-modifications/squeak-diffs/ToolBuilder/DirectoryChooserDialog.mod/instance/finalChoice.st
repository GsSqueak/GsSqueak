ui details
finalChoice
	"return the chosen directory that was saved by an accept click or nil; client must check for validity"

	^ finalChoice
		ifNotNil: [self directory]