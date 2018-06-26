*SqClassCreation
indexableSubclassInNoDictionary: aString instVarNames: anArrayOfStrings classVars: anArrayOfClassVars classInstVars: anArrayOfClassInstVars poolDictionaries: anArrayOfPoolDicts category: aCategoryName newVersionOf: old description: aDescription options: optionsArray
  | cl dict |
  dict := SymbolDictionary new.
  old ifNotNil: [ dict at: old name asSymbol put: old ].
  cl := self
    indexableSubclass: aString
    instVarNames: anArrayOfStrings
    classVars: anArrayOfClassVars
    classInstVars: anArrayOfClassInstVars
    poolDictionaries: anArrayOfPoolDicts
    inDictionary: dict
    newVersionOf: old
    description: aDescription
    options: optionsArray.
  cl category: aCategoryName asString.
  ^ cl