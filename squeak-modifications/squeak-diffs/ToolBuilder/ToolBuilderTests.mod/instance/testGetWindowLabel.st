tests-window
testGetWindowLabel
	self makeWindow.
	queries := IdentitySet new.
	self changed: #getLabel.
	self assert: (queries includes: #getLabel).