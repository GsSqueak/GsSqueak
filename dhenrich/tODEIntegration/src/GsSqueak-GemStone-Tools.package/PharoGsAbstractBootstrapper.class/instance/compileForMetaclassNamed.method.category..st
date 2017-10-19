compilation
compileForMetaclassNamed: className method: sourceString category: categoryString
  ^ self
    compileForMetaclassNamed: className
    method: sourceString
    category: categoryString
    symbolList: self symbolList
    environmentId: self methodEnvironment