tests-panel
testGetPanelSideEffectFree
	self makePanel.
	queries := IdentitySet new.
	self changed: #testSignalWithNoDiscernableEffect.
	self assert: queries isEmpty.