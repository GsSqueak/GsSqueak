accessing
compilationSymbolList
  ^ compilationSymbolList
    ifNil: [ compilationSymbolList := self defaultSymbolList ]