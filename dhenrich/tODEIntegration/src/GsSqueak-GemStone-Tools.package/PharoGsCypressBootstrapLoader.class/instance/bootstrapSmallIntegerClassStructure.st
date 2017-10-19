bootstrapping
bootstrapSmallIntegerClassStructure
  | smallIntegerSuperclass session |
  self
    createClassNamed: 'Magnitude' superclassName: 'Object';
    createClassNamed: 'Number' superclassName: 'Magnitude';
    yourself.
  smallIntegerSuperclass := self
    createClassNamed: 'Integer'
    superclassName: 'Number'.
  self class pharoSymbolList: self symbolList.
  System commit.
  session := TDGsExternalSession
    sessionForStone: (System stoneName subStrings: $!) last
    userName: 'SystemUser'
    password: 'swordfish'.
  session topez: (TDTopezServer for: 1).
  [ 
  session
    login;
    logoutOnClose: true.
  self ensureSystemUserMethodsPresent: session.
  session
    executeString:
        '((AllUsers userWithId: ''DataCurator'' ifAbsent: [  ])
    objectNamed: #''PharoGsAbstractBootstrapper'') new
    installSuperclass: (Object _objectForOop: '
            , smallIntegerSuperclass asOop printString
            ,
              ')
    for: SmallInteger
    environmentId: '
            , self methodEnvironment printString;
    commit;
    yourself ]
    ensure: [ session logout ].
  self smalltalk at: #'SmallInteger' put: SmallInteger.
  System commit