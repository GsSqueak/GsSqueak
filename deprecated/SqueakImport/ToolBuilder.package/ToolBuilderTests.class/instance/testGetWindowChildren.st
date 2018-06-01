tests-window
testGetWindowChildren
	self makeWindow.
	queries := IdentitySet new.
	self changed: #getChildren.
	self assert: (queries includes: #getChildren).