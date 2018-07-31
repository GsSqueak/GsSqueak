translating
asGemstoneNodeInEnvironment: env
  gsBlock := (GemstoneSmalltalk _env0 at: #GsComBlockNode) _env0 new _env0 lexLevel: LexLevel.
  LexLevel := LexLevel + 1.
  self arguments
    do: [ :arg | gsBlock _env0 appendArg: (arg asGemstoneLeafInEnvironment: env forBlock: self) ].
  self temporaries
    do: [ :tmp | 
      | gsVarLeaf |
      gsVarLeaf := tmp asGemstoneBlockTemp.
      gsVarLeaf _env0 varKind = 1
        ifTrue: [ gsBlock _env0 appendTemp: gsVarLeaf ] ].

  self translateStatements: env.

  LexLevel := LexLevel - 1.
  ^ gsBlock
