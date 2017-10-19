accessing
defaultSymbolList
  ^ SymbolList new
    addLast: self undefinedGlobals;
    addLast: self smalltalk;
    yourself