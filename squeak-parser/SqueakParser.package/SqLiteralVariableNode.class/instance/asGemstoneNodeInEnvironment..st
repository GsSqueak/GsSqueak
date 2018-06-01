translating
asGemstoneNodeInEnvironment: env
  | varNode varLeaf |
  ^ GsComVariableNode new leaf: self asGemstoneLeaf