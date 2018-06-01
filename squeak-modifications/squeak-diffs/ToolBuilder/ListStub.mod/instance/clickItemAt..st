simulating
clickItemAt: anInteger
	| selector |
	selector := spec setIndex.
	selector
		ifNil: [self model perform: spec setSelected with: (self list at: anInteger)]
		ifNotNil: [self model perform: selector with: anInteger]
