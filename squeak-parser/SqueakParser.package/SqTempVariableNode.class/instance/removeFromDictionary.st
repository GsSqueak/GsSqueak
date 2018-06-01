translating
removeFromDictionary
  | varLeaf currentKey |
  currentKey := self key asSymbol.
  SqParser methodVarDict
    removeKey: currentKey
    ifAbsent: [ 
      "Already removed"
       ]