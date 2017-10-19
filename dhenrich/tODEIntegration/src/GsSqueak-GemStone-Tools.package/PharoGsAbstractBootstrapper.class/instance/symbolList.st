accessing
symbolList
  ^ symbolList ifNil: [ symbolList := self defaultSymbolList ]