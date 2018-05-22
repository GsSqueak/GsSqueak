translating
asSqParseNode
  ^ SqMessageNode new
    receiver:
        (SqLiteralVariableNode new
            key: (SymbolAssociation new key: #'Context'
            value: Context));
    selector: (SqSelectorNode new key: #'createContext');
    arguments: #()
