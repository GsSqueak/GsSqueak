translating
asGemstoneNodeInEnvironment: env
  " Object undeclared, don't lookup in SmalltalkProxy"

  ^ GsComVariableNode new
    leaf:
      (GsComVarLeaf new literalVariable: (SqueakEnvironment undeclare: tag asSymbol))