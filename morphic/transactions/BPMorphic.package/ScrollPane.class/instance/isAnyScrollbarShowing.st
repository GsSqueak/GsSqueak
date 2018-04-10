geometry testing
isAnyScrollbarShowing
	^ self hIsScrollbarShowing
		or: [self vIsScrollbarShowing]