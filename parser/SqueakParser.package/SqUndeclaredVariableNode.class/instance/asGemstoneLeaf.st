translating
asGemstoneLeaf
  " Object undeclared, lookup in SmalltalkProxy"

  ^ GsComVarLeaf new
    literalVariable: (SqueakEnvironment undeclare: tag asSymbol)