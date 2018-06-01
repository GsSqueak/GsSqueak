tests-button
testButtonFiresBlock
	| spec |
	spec := builder pluggableButtonSpec new.
	spec model: self.
	spec action: [self fireButton].
	widget := builder build: spec.
	queries := IdentitySet new.
	self fireButtonWidget.
	self assert: (queries includes: #fireButton).