compilation
compileForMetaclassNamed: className method: sourceString category: categoryString symbolList: aSymbolList environmentId: anEnvironmentId
  self
    compileForBehavior: (self symbolList objectNamed: className) class
    method: sourceString
    category: categoryString
    symbolList: aSymbolList
    environmentId: anEnvironmentId