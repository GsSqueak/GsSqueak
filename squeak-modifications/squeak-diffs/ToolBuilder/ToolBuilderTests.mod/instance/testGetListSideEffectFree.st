tests-lists
testGetListSideEffectFree
	self makeList.
	queries := IdentitySet new.
	self changed: #testSignalWithNoDiscernableEffect.
	self assert: queries isEmpty.