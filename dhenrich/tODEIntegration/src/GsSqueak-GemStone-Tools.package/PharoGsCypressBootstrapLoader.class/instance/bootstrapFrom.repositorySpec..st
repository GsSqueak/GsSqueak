package bootstrap
bootstrapFrom: packageName repositorySpec: repositorySpec
  | packageManager repo |
  packageManager := PharoGsCypressPackageManager3 new.
  repo := CypressAbstractRepository
    onUrl: (CypressUrl absoluteFromText: repositorySpec)
    alias: ''.
  packageManager
    defaultSymbolDictionaryName: self smalltalk name;
    defaultSymbolList: self symbolList;
    defaultEnvironmentId: self methodEnvironment;
    addResolvedReference:
        (CypressResolvedReference name: packageName repository: repo);
    loadResolvedReferences