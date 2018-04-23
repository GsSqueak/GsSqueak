translating
asSqParseNode
  ^ SqMessageNode new
    receiver:
        (SqLiteralVariableNode new
            key: (SymbolAssociation new key: #'Context'
            name: #'Context');
    selector: (SqSelectorNode new key: #'createContext');
    arguments: #()
