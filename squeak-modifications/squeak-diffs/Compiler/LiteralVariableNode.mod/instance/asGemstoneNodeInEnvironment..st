translating
asGemstoneNodeInEnvironment: env
  | varNode varLeaf |
  ^ (GemstoneSmalltalk _env0 at: #GsComVariableNode) _env0 new _env0 leaf: self asGemstoneLeaf
