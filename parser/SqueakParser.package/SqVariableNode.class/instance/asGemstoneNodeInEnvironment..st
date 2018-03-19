translating
asGemstoneNodeInEnvironment: env
  | gsVariableNode |
  gsVariableNode := GsComVariableNode newSelf.
  self key = 'self'
    ifTrue: [ gsVariableNode varLeaf initializeSelf ].
  ^ gsVariableNode