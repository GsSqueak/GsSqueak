translating
asGemstoneBlockTemp
  | currentKey |
  currentKey := self key asSymbol.
  ^ gsLeaf
    ifNil: [ gsLeaf := GsComVarLeaf new blockTemp: currentKey sourceLexLevel: 1 ]