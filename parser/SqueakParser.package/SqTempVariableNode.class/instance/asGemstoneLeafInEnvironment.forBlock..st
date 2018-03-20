translating
asGemstoneLeafInEnvironment: env forBlock: aGsComBlockNode
  | gsVarLeaf |
  self halt.
  gsVarLeaf := GsComVarLeaf new.
  self isBlockArg
    ifTrue: [ 
      gsVarLeaf
        blockArg: self key asSymbol
        argNumber: self index
        forBlock: aGsComBlockNode ]
    ifFalse: [ ^ self fail ].
  ^ gsVarLeaf