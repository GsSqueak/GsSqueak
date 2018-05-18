translating
asGemstoneNodeInEnvironment: env
  gsBlock := GsComBlockNode new lexLevel: LexLevel.
  LexLevel := LexLevel + 1.
  self arguments
    do: [ :arg | gsBlock appendArg: (arg asGemstoneLeafInEnvironment: env forBlock: self) ].
  self temporaries
    do: [ :tmp | 
      | gsVarLeaf |
      gsVarLeaf := tmp asGemstoneBlockTemp.
      gsVarLeaf varKind = 1
        ifTrue: [ gsBlock appendTemp: gsVarLeaf ] ].
  self statements
    do: [ :statement | gsBlock appendStatement: (statement asGemstoneNodeInEnvironment: env) ].
  LexLevel := LexLevel - 1.
  self removeTemporaries.
  ^ gsBlock