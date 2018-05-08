tests
testAsMutator
	self 
		assert: #x asMutator = #x: ;
		assert: #x: asMutator = #x: ;
		assert: #x asMutator isSymbol