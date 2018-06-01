tests-panel
testGetPanelChildren
	self makePanel.
	queries := IdentitySet new.
	self changed: #getChildren.
	self assert: (queries includes: #getChildren).