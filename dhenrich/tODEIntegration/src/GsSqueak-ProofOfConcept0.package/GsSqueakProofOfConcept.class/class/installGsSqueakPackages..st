private
installGsSqueakPackages: packageNames
  "expect to be installing methods and classes as GsSqueak user"

  "abort at beginning and commit at end"

  | packageManager repo gsSqueakUser |
  System abort.
  packageManager := CypressEnvironmentPackageManager new.
  repo := CypressAbstractRepository
    onUrl:
      (CypressUrl
        absoluteFromText:
          'cypressfiletree:$GS_HOME/shared/repos/BP2017RH1/dhenrich/tODEIntegration/src/')
    alias: ''.
  gsSqueakUser := AllUsers userWithId: 'GsSqueak'.
  packageManager
    defaultSymbolDictionaryName: #'Smalltalk';
    defaultSymbolList: gsSqueakUser symbolList;
    defaultEnvironmentId: 7.
  packageNames
    do: [ :packageName | 
      packageManager
        addResolvedReference:
          (CypressResolvedReference name: packageName repository: repo) ].
  packageManager loadResolvedReferences.
  System commit