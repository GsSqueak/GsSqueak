translating
asGemstoneLeafInEnvironment: env forBlock: aGsComBlockNode
  | currentKey |
  self assert: self isBlockArg.
  currentKey := self key asSymbol.
  ^ SqParser methodVarDict
    at: currentKey
    ifAbsentPut: [ 
      GsComVarLeaf new
        blockArg: currentKey
        argNumber: self index + 1
        forBlock: aGsComBlockNode ]