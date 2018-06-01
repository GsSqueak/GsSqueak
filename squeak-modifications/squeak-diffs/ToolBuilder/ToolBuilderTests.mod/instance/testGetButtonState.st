tests-button
testGetButtonState
	self makeButton.
	queries := IdentitySet new.
	self changed: #getState.
	self assert: (queries includes: #getState).