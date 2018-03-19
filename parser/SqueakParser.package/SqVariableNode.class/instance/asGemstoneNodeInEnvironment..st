translating
asGemstoneNodeInEnvironment: env
  | gsVariableNode |
  gsVariableNode := GsComVariableNode new.
  self key = 'self'
    ifTrue: [ ^ gsVariableNode leaf: GsComVarLeaf new initializeSelf ].
  gsVariableNode leaf: GsComVarLeaf new.
  ^ gsVariableNode