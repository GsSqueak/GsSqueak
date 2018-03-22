translating
asGemstoneBlockTemp
  | currentKey leaf |
  currentKey := self key asSymbol.
  leaf := SqParser methodVarDict
    at: currentKey
    ifAbsentPut: [ GsComVarLeaf new blockTemp: currentKey sourceLexLevel: 1 ].
  ^ leaf