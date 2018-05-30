tests-lists
testGetItemListSideEffectFree
	self makeItemList.
	queries := IdentitySet new.
	self changed: #testSignalWithNoDiscernableEffect.
	self assert: queries isEmpty.