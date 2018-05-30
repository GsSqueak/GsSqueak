tests-text
testGetTextSideEffectFree
	self makeText.
	queries := IdentitySet new.
	self changed: #testSignalWithNoDiscernableEffect.
	self assert: queries isEmpty.