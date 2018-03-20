translating
asGemstoneNodeInEnvironment: env
  | gsVariableNode gsVarLeaf currentKey |
  gsVariableNode := GsComVariableNode new.
  gsVariableNode leaf: self asGemstoneLeaf.
  ^ gsVariableNode