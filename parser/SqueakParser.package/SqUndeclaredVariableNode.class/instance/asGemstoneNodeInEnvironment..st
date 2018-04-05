translating
asGemstoneNodeInEnvironment: env
  " Object undeclared, lookup in SmalltalkProxy"

  ^ GsComSendNode new
    stSelector: #'at:';
    rcvr:
        (GsComVariableNode new
            leaf:
              (GsComVarLeaf new
                literalVariable:
                  (SymbolAssociation new key: #'Smalltalk' value: Smalltalk)));
    appendArgument:
        (GsComLiteralNode new
            leaf:
              (GsComLitLeaf new symbolLiteral: ('Squeak' , self tag) asSymbol))