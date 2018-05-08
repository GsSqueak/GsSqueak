testing-printing
testStoreStringAll
	Character allByteCharacters do: [ :each |
		self assert: (self class newCompiler 
			evaluate: each storeString) = each ].