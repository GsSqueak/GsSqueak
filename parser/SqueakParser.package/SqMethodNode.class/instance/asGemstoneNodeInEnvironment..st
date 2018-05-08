translating
asGemstoneNodeInEnvironment: anEnvironment
  | gsMethodNode env |
  "Set Environment according to Pragma"
  env := (self properties at: #'messageSendInEnv:' ifAbsent: [ nil ])
    ifNil: [ anEnvironment ]
    ifNotNil: [ (self properties at: #'messageSendInEnv:') arguments first ].	"set compile env"
  SqBlockNode lexLevel: 1.
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
  (primitive := self properties at: #'primitive:' ifAbsent: [ nil ])
    ifNotNil: [ 
      "Set IRNode Prim Number"
      gsMethodNode setPrimitiveNumber: primitive arguments first ].	"set compile env"
  gsMethodNode setCompileEnv: env.
  ^ gsMethodNode
