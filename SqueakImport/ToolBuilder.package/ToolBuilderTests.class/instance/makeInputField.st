tests-input
makeInputField
	| spec |
	spec := self makeInputFieldSpec.
	widget := builder build: spec.