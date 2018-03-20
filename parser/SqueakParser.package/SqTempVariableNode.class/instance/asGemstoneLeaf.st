translating
asGemstoneLeaf
  | varLeaf currentKey |
  currentKey := self key asSymbol.
  varLeaf := SqParser methodVarDict
    at: currentKey
    ifAbsent: [ 
      argType = #'block'
        ifTrue: [ 
          varLeaf := GsComVarLeaf new
            blockArg: currentKey
            argNumber: self index + 1
            forBlock: (GsComBlockNode new lexLevel: 1) ].
      argType = #'method'
        ifTrue: [ varLeaf := GsComVarLeaf new methodArg: currentKey argNumber: self index + 1 ].
      argType ifNil: [ varLeaf := GsComVarLeaf new methodTemp: currentKey ].
      SqParser methodVarDict at: currentKey put: varLeaf ].
  ^ varLeaf