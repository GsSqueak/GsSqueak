translating
asGemstoneNodeInEnvironment: env
  | gsMethodNode |
  gsMethodNode := GsComMethNode newSmalltalk.
  gsMethodNode
    selector: self selector;
    source: self sourceText.
  self temporaries
    do: [ :tempVar | gsMethodNode appendTemp: tempVar asGemstoneLeaf ].
  self block statements
    do: [ :statement | gsMethodNode appendStatement: (statement asGemstoneNodeInEnvironment: env) ].
  ^ gsMethodNode