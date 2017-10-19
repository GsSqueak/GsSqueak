operations
loadClassDefinition: aPatchOperation
  [ aPatchOperation
    loadClassDefinition: self defaultSymbolDictionaryName
    lookupSymbolList: self lookupSymbolList
    compilationSymbolList: self compilationSymbolList ]
    on: Error
    do: [ :ex | self handlePatchOperation: aPatchOperation failure: ex ]