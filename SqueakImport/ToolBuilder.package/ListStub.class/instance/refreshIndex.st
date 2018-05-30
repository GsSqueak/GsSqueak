events
refreshIndex
	| selector |
	selector := spec getIndex.
	index := selector
		ifNil: [self list indexOf: (self model perform: spec getSelected)]
		ifNotNil: [spec model perform: selector]
