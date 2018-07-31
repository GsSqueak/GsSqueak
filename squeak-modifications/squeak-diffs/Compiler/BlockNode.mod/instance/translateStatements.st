translating
translateStatements: env

  self statements
    do: [ :statement | gsBlock _env0 appendStatement: (statement asGemstoneNodeInEnvironment: env) ].
