as yet unclassified
asSqParseNode
  ^ SqMessageNode new
    receiver:
        (SqLiteralVariableNode new
            key: (SymbolAssociation new key: #'MockContext' value: MockContext);
            name: #'MockContext');
    selector: (SqSpecialSelectorNode new key: #'new');
    arguments: #()