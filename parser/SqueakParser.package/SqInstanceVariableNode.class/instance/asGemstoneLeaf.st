translating
asGemstoneLeaf
  | varLeaf currentKey |
  currentKey := self key asSymbol.
  varLeaf := SqParser methodVarDict
    at: currentKey
    ifAbsentPut: [ GsComVarLeaf new instanceVariable: currentKey ivOffset: self index + 1 ].
  ^ varLeaf