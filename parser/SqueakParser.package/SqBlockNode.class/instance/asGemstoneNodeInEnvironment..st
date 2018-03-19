translating
asGemstoneNodeInEnvironment: env
  | gsBlockNode |
  gsBlockNode := GsComBlockNode new lexLevel: 1.
  self arguments
    do: [ :arg | 
      gsBlockNode
        appendArg: (arg asGemstoneLeafInEnvironment: env forBlock: gsBlockNode) ].
  self temporaries
    do: [ :tmp | gsBlockNode appendTemp: (tmp asGemstoneNodeInEnvironment: env) ].
  self statements
    do: [ :statement | gsBlockNode appendStatement: (statement asGemstoneNodeInEnvironment: env) ].
  ^ gsBlockNode