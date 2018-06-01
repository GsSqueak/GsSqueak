tests-window
testGetWindowSideEffectFree
	self makeWindow.
	queries := IdentitySet new.
	self changed: #testSignalWithNoDiscernableEffect.
	self assert: queries isEmpty.