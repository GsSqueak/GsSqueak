operations
postLoad: aPatchOperation
  [ 
  aPatchOperation
    postLoadDefinition: lookupSymbolList
    environmentId: self defaultEnvironmentId ]
    on: Error
    do: [ :ex | self handlePatchOperation: aPatchOperation failure: ex ]