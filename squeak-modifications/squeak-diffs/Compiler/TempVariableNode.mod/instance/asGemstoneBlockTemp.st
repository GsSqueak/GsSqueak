translating
asGemstoneBlockTemp
  | currentKey |
  currentKey := self key asSymbol.
  ^ gsLeaf
    ifNil: [ gsLeaf := (GemstoneSmalltalk _env0 at: #GsComVarLeaf) _env0 new _env0 blockTemp: currentKey sourceLexLevel: 1 ]
