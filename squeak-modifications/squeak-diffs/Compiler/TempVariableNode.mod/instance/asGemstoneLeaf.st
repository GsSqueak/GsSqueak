translating
asGemstoneLeaf
  | varLeaf currentKey |
  currentKey := self key asSymbol.
  gsLeaf
    ifNil: [ 
      argType = #'block'
        ifTrue: [ 
          gsLeaf := (GemstoneSmalltalk _env0 at: #GsComVarLeaf) _env0 new _env0
            blockArg: currentKey
            argNumber: self index + 1
            forBlock: ((GemstoneSmalltalk _env0 at: #GsComBlockNode) _env0 new _env0 lexLevel: 1) ].
      argType = #'method'
        ifTrue: [ gsLeaf := (GemstoneSmalltalk _env0 at: #GsComVarLeaf) _env0 new _env0 methodArg: currentKey argNumber: self index + 1 ].
      argType ifNil: [ gsLeaf := (GemstoneSmalltalk _env0 at: #GsComVarLeaf) _env0 new _env0 methodTemp: currentKey ] ].
  ^ gsLeaf
