translating
asGemstoneNodeInEnvironment: env
  | gsVariableNode |
  gsVariableNode := GsComVariableNode new.
  self key = 'self'
    ifTrue: [ ^ gsVariableNode leaf: GsComVarLeaf new initializeSelf ].
  self key = 'true'
    ifTrue: [ ^ GsComLiteralNode newTrue ].
  self key = 'false'
    ifTrue: [ ^ GsComLiteralNode newFalse ].
  self key = 'nil'
    ifTrue: [ ^ GsComLiteralNode newNil ].
  gsVariableNode leaf: GsComVarLeaf new.
  ^ gsVariableNode