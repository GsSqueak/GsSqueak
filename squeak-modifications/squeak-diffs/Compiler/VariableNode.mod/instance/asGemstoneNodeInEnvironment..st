translating
asGemstoneNodeInEnvironment: env
  | gsVariableNode |
  gsVariableNode := (GemstoneSmalltalk _env0 at: #GsComVariableNode) _env0 new.
  self key = 'self'
    ifTrue: [ 
      ^ gsVariableNode
        _env0 leaf: (gsLeaf ifNil: [ gsLeaf := (GemstoneSmalltalk _env0 at: #GsComVarLeaf) _env0 new _env0 initializeSelf ]) ].
  self key = 'true'
    ifTrue: [ ^ (GemstoneSmalltalk _env0 at: #GsComLiteralNode) _env0 newTrue ].
  self key = 'false'
    ifTrue: [ ^ (GemstoneSmalltalk _env0 at: #GsComLiteralNode) _env0 newFalse ].
  self key = 'nil'
    ifTrue: [ ^ (GemstoneSmalltalk _env0 at: #GsComLiteralNode) _env0 newNil ].
  self key = 'super'
    ifTrue: [ ^ gsVariableNode _env0 leaf: (GemstoneSmalltalk _env0 at: #GsComVarLeaf) _env0 new _env0 initializeSuper ].
  self key = 'thisContext'
    ifTrue: [ ^ Context asSqParseNode asGemstoneNodeInEnvironment: 0 ].
  self fail
