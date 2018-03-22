translating
asGemstoneNodeInEnvironment: env
  | gsVariableNode |
  gsVariableNode := GsComVariableNode new.
  self key = 'self'
    ifTrue: [ 
      ^ gsVariableNode
        leaf:
          (SqParser methodVarDict
            at: #'self'
            ifAbsentPut: [ GsComVarLeaf new initializeSelf ]) ].
  self key = 'true'
    ifTrue: [ ^ GsComLiteralNode newTrue ].
  self key = 'false'
    ifTrue: [ ^ GsComLiteralNode newFalse ].
  self key = 'nil'
    ifTrue: [ ^ GsComLiteralNode newNil ].
  self key = 'super'
    ifTrue: [ ^ gsVariableNode leaf: GsComVarLeaf new initializeSuper ].
  self fail