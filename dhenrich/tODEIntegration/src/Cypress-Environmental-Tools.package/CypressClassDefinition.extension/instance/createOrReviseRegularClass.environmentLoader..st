*cypress-environmental-tools
createOrReviseRegularClass: aSymbolDictionaryName environmentLoader: environmentLoader
  "To be resolved:
		- the question of an 'environment' in which to create the class.
		- the question of which SymbolDictionary in which to create the class.
	 These are perhaps the same question."

  | superClass lookupSymbolList |
  lookupSymbolList := environmentLoader lookupSymbolList.
  superClass := (lookupSymbolList resolveSymbol: self superclassName) value.
  ^ (superClass
    subclass: self name
    instVarNames: (self instVarNames collect: [ :each | each asSymbol ])
    classVars: (self classVarNames collect: [ :each | each asSymbol ])
    classInstVars: (self classInstVarNames collect: [ :each | each asSymbol ])
    poolDictionaries: #()
    inDictionary:
      ((self symbolDictionaryForClassNamed: self name symbolList: lookupSymbolList)
        ifNil: [ (lookupSymbolList resolveSymbol: aSymbolDictionaryName) value ])
    options: #())
    category: category;
    comment: self comment