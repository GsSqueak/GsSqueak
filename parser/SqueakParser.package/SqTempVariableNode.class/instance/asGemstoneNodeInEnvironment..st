translating
asGemstoneNodeInEnvironment: env
  | gsVariableNode gsVarLeaf currentKey |
  gsVariableNode := GsComVariableNode new.
  gsVariableNode leaf: self asGemstoneLeaf.
  Transcript
    show: currentKey;
    show: self asGemstoneLeaf;
    cr.
  ^ gsVariableNode