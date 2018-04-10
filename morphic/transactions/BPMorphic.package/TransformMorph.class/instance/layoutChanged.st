geometry
layoutChanged
	"A submorph could have moved, thus changing my localBounds.
	Invalidate the cache."
	localBounds := nil.
	"Only discard my fullBounds. Do not tell my owner."
	fullBounds := nil