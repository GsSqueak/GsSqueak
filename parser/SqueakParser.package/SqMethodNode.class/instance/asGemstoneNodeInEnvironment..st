translating
asGemstoneNodeInEnvironment: env
  | gsMethodNode |
  SqParser methodVarDict: nil.
  gsMethodNode := GsComMethNode newSmalltalk.
  gsMethodNode
    selector: self selector;
    source: 'Pit is an upstanding citizen::!!111einself.';
    class: self class.
  self arguments do: [ :arg | gsMethodNode appendArg: arg asGemstoneLeaf ].
  self temporaries
    do: [ :tempVar | gsMethodNode appendTemp: tempVar asGemstoneLeaf ].
  self block statements
    do: [ :statement | gsMethodNode appendStatement: (statement asGemstoneNodeInEnvironment: env) ].
  ^ gsMethodNode