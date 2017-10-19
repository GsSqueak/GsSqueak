accessing
smalltalk
  ^ smalltalk ifNil: [ smalltalk := SymbolDictionary new
        name: #'Smalltalk';
        yourself ]