operations
loadClassDefinition: aPatchOperation
  [ 
  aPatchOperation
    loadClassDefinition: self defaultSymbolDictionaryName
    environmentLoader: self ]
    on: Error
    do: [ :ex | self handlePatchOperation: aPatchOperation failure: ex ]