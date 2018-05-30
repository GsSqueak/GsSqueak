tests-trees
makeTree
	| spec |
	spec := self makeTreeSpec.
	widget := builder build: spec.