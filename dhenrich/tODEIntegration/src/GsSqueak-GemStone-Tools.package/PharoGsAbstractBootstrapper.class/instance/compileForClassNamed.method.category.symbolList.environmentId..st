compilation
compileForClassNamed: className method: sourceString category: categoryString symbolList: aSymbolList environmentId: anEnvironmentId
  self
    compileForBehavior: (self symbolList objectNamed: className)
    method: sourceString
    category: categoryString
    symbolList: aSymbolList
    environmentId: anEnvironmentId