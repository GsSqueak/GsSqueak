translating
asGemstoneLeaf
  " Object undeclared, lookup in SmalltalkProxy"

  ^ (GemstoneSmalltalk _env0 at: #GsComVarLeaf) _env0 new _env0
    literalVariable:
      (Smalltalk globals undeclare: tag asSymbol)
