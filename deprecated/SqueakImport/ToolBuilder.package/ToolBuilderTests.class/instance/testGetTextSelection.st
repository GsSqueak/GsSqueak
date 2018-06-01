tests-text
testGetTextSelection
	self makeText.
	queries := IdentitySet new.
	self changed: #getTextSelection.
	self assert: (queries includes: #getTextSelection).