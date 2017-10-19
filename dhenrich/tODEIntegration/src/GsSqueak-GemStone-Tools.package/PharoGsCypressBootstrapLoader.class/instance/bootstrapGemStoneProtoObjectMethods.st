bootstrapping
bootstrapGemStoneProtoObjectMethods
  "These methods are needed in envionment 0 for the time being"

  #(#'error:' #'doesNotUnderstand:' #'isBehavior' #'isNil' #'_errorExpectedClass:' #'_validateClass:')
    do: [ :selector | | sourceString |
      sourceString := (ProtoObject compiledMethodAt: selector) sourceString.
      self
        compileForClassNamed: 'ProtoObject'
        method: sourceString
        category: 'gemstone system support - env 0'
        symbolList: GsSession currentSession symbolList
        environmentId: 0.
      selector numArgs = 0
        ifTrue: [ self
            compileForClassNamed: 'ProtoObject'
            method: selector asString , ' ^self @env2: ' , selector asString
            category: 'gemstone system support - env 2'
            symbolList: self symbolList
            environmentId: self methodEnvironment ]
        ifFalse: [ self
            compileForClassNamed: 'ProtoObject'
            method:
              selector asString , ' arg ^self @env2: ' , selector asString , ' arg'
            category: 'gemstone system support - env 2'
            symbolList: self symbolList
            environmentId: self methodEnvironment ] ].
  self
    compileForClassNamed: 'ProtoObject'
    method: 'class ^Object _classOf: self'
    category: 'gemstone system support - env 0'
    symbolList: GsSession currentSession symbolList
    environmentId: 0.
  self
    compileForClassNamed: 'ProtoObject'
    method: 'class ^Object @env0: _classOf: self'
    category: 'gemstone system support - env 2'
    symbolList: GsSession currentSession symbolList
    environmentId: self methodEnvironment.
  self
    compileForMetaclassNamed: 'ProtoObject'
    method: 'new ^self @env0: basicNew'
    category: 'instance creation - env 2'
    symbolList: GsSession currentSession symbolList
    environmentId: self methodEnvironment