translating
asGemstoneLeaf
  ^ gsLeaf
    ifNil: [ 
      gsLeaf := GsComVarLeaf new
        instanceVariable: self key asSymbol
        ivOffset: self index + 1 ]