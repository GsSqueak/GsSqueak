translating
asGemstoneNodeInEnvironment: anEnvironment
  | gsMethodNode env |
  "Set Environment according to Pragma"
  env := (self properties at: #'messageSendsInEnv:' ifAbsent: [ nil ])
    ifNil: [ anEnvironment ]
    ifNotNil: [ (self properties at: #'messageSendsInEnv:') arguments first ].	"set compile env"
  SqBlockNode lexLevel: 1.
  gsMethodNode := GsComMethNode newSmalltalk.
  gsMethodNode
    selector: self selector;
    source: self sourceText;
    class: self originalClass.
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
  gsMethodNode setCompileEnv: anEnvironment.
  ^ gsMethodNode