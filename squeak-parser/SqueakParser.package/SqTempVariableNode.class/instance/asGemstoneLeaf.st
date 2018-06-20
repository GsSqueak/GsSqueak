translating
asGemstoneLeaf
  | varLeaf currentKey |
  currentKey := self key asSymbol.
  gsLeaf
    ifNil: [ 
      argType = #'block'
        ifTrue: [ 
          gsLeaf := GsComVarLeaf new
            blockArg: currentKey
            argNumber: self index + 1
            forBlock: (GsComBlockNode new lexLevel: 1) ].
      argType = #'method'
        ifTrue: [ gsLeaf := GsComVarLeaf new methodArg: currentKey argNumber: self index + 1 ].
      argType ifNil: [ gsLeaf := GsComVarLeaf new methodTemp: currentKey ] ].
  ^ gsLeaf