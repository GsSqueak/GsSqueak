bootstrap package loading
bootstrapFrom: packageNames repositorySpec: repositorySpec compilationSymbolList: compilationSymbolList lookupSymbolList: lookupSymbolList envId: envId
  | repo packageManager |
  repo := CypressAbstractRepository
    onUrl: (CypressUrl absoluteFromText: repositorySpec)
    alias: ''.
  packageManager := self packageManager.
  packageManager
    defaultSymbolDictionaryName: self smalltalk name;
    compilationSymbolList: compilationSymbolList;
    lookupSymbolList: lookupSymbolList;
    defaultEnvironmentId: envId.
  packageNames
    do: [ :packageName | 
      packageManager
        addResolvedReference:
          (CypressResolvedReference name: packageName repository: repo) ].
  packageManager loadResolvedReferences