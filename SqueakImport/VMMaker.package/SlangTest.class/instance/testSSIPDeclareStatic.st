testing ssip plugins
testSSIPDeclareStatic
	"A static directive should cause the generated function to be declared static."

	| stss m1 p1 m2 p2 |
	stss := SlangTestSupportSSIP inline: false.
	m1 := (stss asCString: #declareStaticTrueByMethod)
			copyReplaceAll: 'declareStaticTrueByMethod'
			with: 'methodName'.
	p1 := (stss asCString: #declareStaticTrueByPragma)
			copyReplaceAll: 'declareStaticTrueByPragma'
			with: 'methodName'.
	self assert: m1 = p1.

	m2 := (stss asCString: #declareStaticFalseByMethod)
			copyReplaceAll: 'declareStaticFalseByMethod'
			with: 'methodName'.
	p2 := (stss asCString: #declareStaticFalseByPragma)
			copyReplaceAll: 'declareStaticFalseByPragma'
			with: 'methodName'.
	self assert: m2 = p2.

	"verify that the keyword 'static appears in the generated C source"
	self assert: (m1 includesSubString: 'static').
	self assert: (p1 includesSubString: 'static').
	self deny: (m2 includesSubString: 'static').
	self deny: (p2 includesSubString: 'static')
