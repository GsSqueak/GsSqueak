tests-input
testGetInputFieldSelection
	self makeInputField.
	queries := IdentitySet new.
	self changed: #getTextSelection.
	self assert: (queries includes: #getTextSelection).