bootstrap package loading
bootstrapFrom: packageNames repositorySpec: repositorySpec
  ^ self
    bootstrapFrom: packageNames
    repositorySpec: repositorySpec
    compilationSymbolList: self symbolList
    lookupSymbolList: self symbolList
    envId: self methodEnvironment