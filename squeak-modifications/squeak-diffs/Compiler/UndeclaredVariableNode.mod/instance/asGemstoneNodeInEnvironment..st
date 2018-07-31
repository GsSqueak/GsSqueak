translating
asGemstoneNodeInEnvironment: env
  " Object undeclared, don't lookup in SmalltalkProxy"

  ^ (GemstoneSmalltalk _env0 at: #GsComVariableNode) _env0 new _env0 leaf: self asGemstoneLeaf
