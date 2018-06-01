tests-button
testButtonInitiallyDisabledSelector
	| spec |
	spec := builder pluggableButtonSpec new.
	spec model: self.
	spec label: #getLabel.
	spec color: #getColor.
	spec state: #getState.
	spec enabled: #returnFalse.
	widget := builder build: spec.
	self deny: (self buttonWidgetEnabled)