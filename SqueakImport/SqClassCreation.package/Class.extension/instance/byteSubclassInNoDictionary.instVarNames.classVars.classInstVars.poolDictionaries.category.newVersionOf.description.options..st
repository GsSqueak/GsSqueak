*SqClassCreation
byteSubclassInNoDictionary: aString instVarNames: instVars classVars: anArrayOfClassVars classInstVars: anArrayOfClassInstVars poolDictionaries: anArrayOfPoolDicts category: cat newVersionOf: oldClass description: aDescription options: optionsArray
  | dict cl |
  dict := SymbolDictionary new.
  oldClass ifNotNil: [ dict at: oldClass name asSymbol put: oldClass ].
  instVars isEmpty
    ifFalse: [ 
      self error: 'A non-pointer class cannot have named instance variables'.
      ^ nil ].
  cl := self
    byteSubclass: aString
    classVars: anArrayOfClassVars
    classInstVars: anArrayOfClassInstVars
    poolDictionaries: anArrayOfPoolDicts
    inDictionary: dict
    newVersionOf: oldClass
    description: aDescription
    options: optionsArray.
  cl category: cat asString.
  ^ cl