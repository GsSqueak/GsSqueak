accessing
lookupSymbolList
  ^ lookupSymbolList ifNil: [ lookupSymbolList := self defaultSymbolList ]