translating
asGemstoneNodeInEnvironment: env
  " Object undeclared, don't lookup in SmalltalkProxy"

  ^ GsComVariableNode new leaf: self asGemstoneLeaf