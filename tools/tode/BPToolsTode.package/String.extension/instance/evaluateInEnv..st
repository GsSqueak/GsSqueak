*BPToolsTode
evaluateInEnv: envID
  "Compiles the receiver as an unbound method and executes it using the current
 default symbol list."

  ^ (self
    _compileInContext: nil
    symbolList: GsSession currentSession symbolList
    oldLitVars: nil
    environmentId: envID
    flags: 0) _executeInContext: nil