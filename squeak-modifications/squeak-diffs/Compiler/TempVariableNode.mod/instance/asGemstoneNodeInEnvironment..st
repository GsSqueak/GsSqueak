translating
asGemstoneNodeInEnvironment: env
  | gsVariableNode gsVarLeaf currentKey |
  gsVariableNode := (GemstoneSmalltalk _env0 at: #GsComVariableNode) _env0 new.
  gsVariableNode _env0 leaf: self asGemstoneLeaf.
  ^ gsVariableNode
