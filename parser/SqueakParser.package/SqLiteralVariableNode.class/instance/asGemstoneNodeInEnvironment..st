translating
asGemstoneNodeInEnvironment: env
  | varNode varLeaf |
  varLeaf := GsComVarLeaf new
    literalVariable:
      (SymbolAssociation new key: self key key value: self key value).
  ^ GsComVariableNode new leaf: varLeaf