translating
asGemstoneLeaf
  ^ gsLeaf
    ifNil: [ 
      gsLeaf := (GemstoneSmalltalk _env0 at: #GsComVarLeaf) _env0 new _env0
        instanceVariable: self key asSymbol
        ivOffset: self index + 1 ]
