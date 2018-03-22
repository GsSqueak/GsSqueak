translating
asGemstoneNodeInEnvironment: env
  | gsBlockNode |
  gsBlockNode := GsComBlockNode new lexLevel: 1.
  self arguments
    do: [ :arg | 
      gsBlockNode
        appendArg: (arg asGemstoneLeafInEnvironment: env forBlock: gsBlockNode) ].
  self temporaries
    do: [ :tmp | 
      | gsVarLeaf |
      gsVarLeaf := tmp asGemstoneBlockTemp.
      gsVarLeaf varKind = 1
        ifTrue: [ gsBlockNode appendTemp: gsVarLeaf ] ].
  self statements
    do: [ :statement | gsBlockNode appendStatement: (statement asGemstoneNodeInEnvironment: env) ].
  ^ gsBlockNode