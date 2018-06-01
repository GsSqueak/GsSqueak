tests-button
testButtonFiresSymbol
	| spec |
	spec := builder pluggableButtonSpec new.
	spec model: self.
	spec action: #fireButton.
	widget := builder build: spec.
	queries := IdentitySet new.
	self fireButtonWidget.
	self assert: (queries includes: #fireButton).