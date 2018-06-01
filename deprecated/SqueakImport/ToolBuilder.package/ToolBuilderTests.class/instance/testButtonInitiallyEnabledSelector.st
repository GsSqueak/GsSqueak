tests-button
testButtonInitiallyEnabledSelector
	| spec |
	spec := builder pluggableButtonSpec new.
	spec model: self.
	spec label: #getLabel.
	spec color: #getColor.
	spec state: #getState.
	spec enabled: #returnTrue.
	widget := builder build: spec.
	self assert: (self buttonWidgetEnabled)