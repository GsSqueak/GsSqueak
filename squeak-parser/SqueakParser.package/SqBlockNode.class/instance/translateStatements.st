translating
translateStatements: env

  self statements
    do: [ :statement | gsBlock appendStatement: (statement asGemstoneNodeInEnvironment: env) ].
