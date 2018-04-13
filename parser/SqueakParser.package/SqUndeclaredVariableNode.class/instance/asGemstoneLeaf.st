translating
asGemstoneLeaf
  " Object undeclared, lookup in SmalltalkProxy"

  ^ GsComVarLeaf new
    literalVariable:
      ((Smalltalk at: #'SqueakEnvironment') undeclare: tag asSymbol)