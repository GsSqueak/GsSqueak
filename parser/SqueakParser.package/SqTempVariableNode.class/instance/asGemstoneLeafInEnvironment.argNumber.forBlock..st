translating
asGemstoneLeafInEnvironment: env argNumber: oneBasedArgNum forBlock: aGsComBlockNode
  | gsVarLeaf |
  gsVarLeaf := GsComVarLeaf new.
  self isBlockArg
    ifTrue: [ gsVarLeaf blockArg: self key argNumber: self index forBlock: aGsComBlockNode ]
    ifFalse: [ ^ self fail ].
  ^ gsVarLeaf