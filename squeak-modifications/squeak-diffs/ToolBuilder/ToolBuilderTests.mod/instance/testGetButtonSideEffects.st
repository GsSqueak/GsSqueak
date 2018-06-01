tests-button
testGetButtonSideEffects
	self makeButton.
	queries := IdentitySet new.
	self changed: #testSignalWithNoDiscernableEffect.
	self expectedButtonSideEffects do:[:sym|
		self assert: (queries includes: sym). 
		queries remove: sym.
	].
	self assert: queries isEmpty.