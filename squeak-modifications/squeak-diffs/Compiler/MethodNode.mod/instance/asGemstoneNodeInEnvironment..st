translating
asGemstoneNodeInEnvironment: anEnvironment
  | gsMethodNode env |
  "Set Environment according to Pragma"
  env := (self properties at: #'messageSendsInEnv:' ifAbsent: [ nil ])
    ifNil: [ anEnvironment ]
    ifNotNil: [ (self properties at: #'messageSendsInEnv:') arguments first ].	"set compile env"
  BlockNode lexLevel: 1.
  gsMethodNode := (GemstoneSmalltalk _env0 at: #GsComMethNode) _env0 newSmalltalk.
  gsMethodNode _env0 selector: self selector.
  gsMethodNode _env0 source: self sourceText.
  gsMethodNode _env0 class: self methodClass.
  self arguments do: [ :arg | gsMethodNode _env0 appendArg: arg asGemstoneLeaf ].
  self temporaries
    do: [ :tempVar | gsMethodNode _env0 appendTemp: tempVar asGemstoneLeaf ].
  self block statements
    do: [ :statement | gsMethodNode _env0 appendStatement: (statement asGemstoneNodeInEnvironment: env) ].
  (self block statements last isKindOf: SqReturnNode)
    ifFalse: [ 
      gsMethodNode _env0
        appendStatement:
          (ReturnNode returnSelf asGemstoneNodeInEnvironment: env) ].
  (primitive := self properties at: #'primitive:' ifAbsent: [ nil ])
    ifNotNil: [ 
      "Set IRNode Prim Number"
      gsMethodNode _env0 setPrimitiveNumber: primitive arguments first ].	"set compile env"
  gsMethodNode _env0 setCompileEnv: anEnvironment.
  ^ gsMethodNode
