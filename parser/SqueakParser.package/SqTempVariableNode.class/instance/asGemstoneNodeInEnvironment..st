translating
asGemstoneNodeInEnvironment: env
  | gsVariableNode gsVarLeaf |
  gsVariableNode := GsComVariableNode new.
  gsVarLeaf := GsComVarLeaf new.
  argType = #'block'
    ifTrue: [ 
      gsVarLeaf
        blockArg: self key asSymbol
        argNumber: self index
        forBlock: (GsComBlockNode new lexLevel: 1) ].
  argType ifNil: [ gsVarLeaf methodTemp: self key asSymbol ].
  gsVariableNode leaf: gsVarLeaf.
  ^ gsVariableNode