translating
asGemstoneLeafInEnvironment: env forBlock: aSqBlockNode
  | currentKey |
  self assert: self isBlockArg.
  currentKey := self key asSymbol.
  ^ gsLeaf
    ifNil: [ 
      gsLeaf := (GemstoneSmalltalk _env0 at: #GsComVarLeaf) _env0 new _env0
        blockArg: currentKey
        argNumber: 1
        forBlock: aSqBlockNode gsBlock ]
