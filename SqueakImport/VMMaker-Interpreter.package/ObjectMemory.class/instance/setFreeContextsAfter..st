allocation
setFreeContextsAfter: newContext
	freeContexts := self fetchPointer: 0 ofObject: newContext
