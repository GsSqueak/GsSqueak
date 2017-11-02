private
installGsSqueakPackages: packageNames environmentId: environmentId
  "expect to be installing methods and classes as DataCurato on into GsSqueak symbolList and classes"

  "abort at beginning and commit at end"

  | packageManager repo gsSqueakUser |
  System abort.
  packageManager := CypressEnvironmentPackageManager new.
  repo := CypressAbstractRepository onUrl: self repositoryUrl alias: ''.
  gsSqueakUser := AllUsers userWithId: 'GsSqueak'.
  environmentId == 0
    ifTrue: [ 
      "Installing the environment 0 support methods for classes created in environment 7
       -- need to use the current user's (DataCurator) symbol list to resolve env 0 classes
          for compilation
      -- need to use GsSqueak symbol list for looking up the classes to which the env 0 methods
         are added
      -- no classes should be created at the present time, so don't set 
         defaultSymbolDictionaryName"
      packageManager
        defaultSymbolList: System myUserProfile symbolList;
        lookupSymbolList: gsSqueakUser symbolList;
        defaultEnvironmentId: environmentId ]
    ifFalse: [ 
      packageManager
        defaultSymbolDictionaryName: #'Smalltalk';
        defaultSymbolList: gsSqueakUser symbolList;
        defaultEnvironmentId: environmentId ].
  packageNames
    do: [ :packageName | 
      packageManager
        addResolvedReference:
          (CypressResolvedReference name: packageName repository: repo) ].
  packageManager loadResolvedReferences.
  System commit