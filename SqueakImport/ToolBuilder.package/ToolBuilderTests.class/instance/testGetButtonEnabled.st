tests-button
testGetButtonEnabled
	self makeButton.
	queries := IdentitySet new.
	self changed: #getEnabled.
	self assert: (queries includes: #getEnabled).