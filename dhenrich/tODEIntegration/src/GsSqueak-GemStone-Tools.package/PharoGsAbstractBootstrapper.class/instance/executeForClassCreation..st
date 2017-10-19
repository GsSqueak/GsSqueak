execution
executeForClassCreation: aString
  ^ (aString
    _compileInContext: nil
    symbolList: self symbolList
    oldLitVars: nil
    environmentId: 0
    flags: 0) _executeInContext: nil