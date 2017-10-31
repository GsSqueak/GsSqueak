environment
defaultApplicationEnvironment
  | classLookupSymbolList smalltalk |
  self todeUserId ifNil: [ ^ self defaultTodeEnvironment ].
  smalltalk := System myUserProfile objectNamed: #'Smalltalk'.
  classLookupSymbolList := SymbolList new
    insertObject: smalltalk at: 1;
    yourself.
  ^ TDCustomGsSqueakEnvironment new
    methodCompilationEnvironmentId: self sessionDescription environmentId;
    classLookupEnvironmentId: self sessionDescription environmentId;
    classLookupSymbolList: classLookupSymbolList;
    methodCompilationSymbolList: classLookupSymbolList;
    yourself