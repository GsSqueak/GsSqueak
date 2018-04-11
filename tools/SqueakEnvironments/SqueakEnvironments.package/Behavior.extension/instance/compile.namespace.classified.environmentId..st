*SqueakEnvironments
compile: sourceString namespace: aNamespace classified: aCategoryString environmentId: anEnvironmentId
  | symbolList symbolDict |
  aNamespace class == SymbolList
    ifTrue: [ symbolList := aNamespace ].
  aNamespace class == Environment
    ifTrue: [ 
      symbolDict := SymbolDictionary withAll: aNamespace declarations.
      symbolList := Array with: symbolDict ].
  ^ self
    compileMethod: sourceString
    dictionaries: symbolList
    category: aCategoryString
    environmentId: anEnvironmentId