translating
asGemstoneLeafInEnvironment: env forBlock: aSqBlockNode
  | currentKey |
  self assert: self isBlockArg.
  currentKey := self key asSymbol.
  ^ SqParser methodVarDict
    at: currentKey
    put:
      (aSqBlockNode blockVars
        at: currentKey
        ifAbsentPut: [ 
          GsComVarLeaf new
            blockArg: currentKey
            argNumber: 1
            forBlock: aSqBlockNode gsBlock ])