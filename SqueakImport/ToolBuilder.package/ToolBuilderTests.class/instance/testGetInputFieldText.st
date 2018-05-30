tests-input
testGetInputFieldText
	self makeInputField.
	queries := IdentitySet new.
	self changed: #getText.
	self assert: (queries includes: #getText).