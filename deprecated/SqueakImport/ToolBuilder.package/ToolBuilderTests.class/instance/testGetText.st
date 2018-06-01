tests-text
testGetText
	self makeText.
	queries := IdentitySet new.
	self changed: #getText.
	self assert: (queries includes: #getText).