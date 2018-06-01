tests-button
testGetButtonLabel
	self makeButton.
	queries := IdentitySet new.
	self changed: #getLabel.
	self assert: (queries includes: #getLabel).