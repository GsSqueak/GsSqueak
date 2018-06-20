translating
asGemstoneLeafInEnvironment: env forBlock: aSqBlockNode
  | currentKey |
  self assert: self isBlockArg.
  currentKey := self key asSymbol.
  ^ gsLeaf
    ifNil: [ 
      gsLeaf := GsComVarLeaf new
        blockArg: currentKey
        argNumber: 1
        forBlock: aSqBlockNode gsBlock ]