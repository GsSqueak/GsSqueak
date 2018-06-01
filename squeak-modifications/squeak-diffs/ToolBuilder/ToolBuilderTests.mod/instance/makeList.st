tests-lists
makeList
	| spec |
	spec := self makeListSpec.
	widget := builder build: spec.