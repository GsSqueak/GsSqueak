execution
execute: aString
  ^ (aString
    _compileInContext: nil
    symbolList: self symbolList
    oldLitVars: nil
    environmentId: self methodEnvironment
    flags: 0) _executeInContext: nil