*gssqueak-gemstone-tools
symbolDictionaryForClassNamed: aString symbolList: aSymbolList
  "Answer the SymbolDictionary containing the named class.
	 If there are multiple answers, answer the first.
	 If there are no answers (i.e., the class does not exist), answer
	 the result of evaluating aBlock."

  ^ aSymbolList asArray detect: [ :each | each
        anySatisfy: [ :every | every isBehavior and: [ every name asString = aString asString ] ] ]
  ifNone: [  ]
