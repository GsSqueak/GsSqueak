compilation
compileForClassNamed: className method: sourceString category: categoryString
  ^ self
    compileForClassNamed: className
    method: sourceString
    category: categoryString
    symbolList: self symbolList
    environmentId: self methodEnvironment