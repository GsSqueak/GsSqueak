tests-lists
makeItemList
	| spec |
	spec := self makeItemListSpec.
	widget := builder build: spec.