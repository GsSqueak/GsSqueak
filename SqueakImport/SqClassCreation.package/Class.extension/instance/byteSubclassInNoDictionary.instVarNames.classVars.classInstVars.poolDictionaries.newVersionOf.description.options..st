*SqClassCreation
byteSubclassInNoDictionary: aString instVarNames: instVars classVars: anArrayOfClassVars classInstVars: anArrayOfClassInstVars poolDictionaries: anArrayOfPoolDicts newVersionOf: oldClass description: aDescription options: optionsArray
  ^ self
    byteSubclassInNoDictionary: aString
    instVarNames: instVars
    classVars: anArrayOfClassVars
    classInstVars: anArrayOfClassInstVars
    poolDictionaries: anArrayOfPoolDicts
    inDictionary: SymbolDictionary new
    newVersionOf: oldClass
    description: aDescription
    options: optionsArray