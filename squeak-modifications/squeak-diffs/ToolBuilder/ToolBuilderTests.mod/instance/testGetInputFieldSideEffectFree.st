tests-input
testGetInputFieldSideEffectFree
	self makeInputField.
	queries := IdentitySet new.
	self changed: #testSignalWithNoDiscernableEffect.
	self assert: queries isEmpty.