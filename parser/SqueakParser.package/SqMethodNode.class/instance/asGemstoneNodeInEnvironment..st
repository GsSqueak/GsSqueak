translating
asGemstoneNodeInEnvironment: env
  | gsMethodNode |
  SqParser methodVarDict: nil.
  gsMethodNode := GsComMethNode newSmalltalk.
  gsMethodNode
    selector: self selector;
    source: self sourceText;
    class: self class.
  self arguments do: [ :arg | gsMethodNode appendArg: arg asGemstoneLeaf ].
  self temporaries
    do: [ :tempVar | gsMethodNode appendTemp: tempVar asGemstoneLeaf ].
  self block statements
    do: [ :statement | gsMethodNode appendStatement: (statement asGemstoneNodeInEnvironment: env) ].
  (self block statements last isKindOf: SqReturnNode)
    ifFalse: [ 
      gsMethodNode
        appendStatement:
          (SqReturnNode returnSelf asGemstoneNodeInEnvironment: env) ].
  ^ gsMethodNode