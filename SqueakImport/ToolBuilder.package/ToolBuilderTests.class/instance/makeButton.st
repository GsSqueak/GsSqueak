tests-button
makeButton
	| spec |
	spec := self makeButtonSpec.
	widget := builder build: spec.
	^widget