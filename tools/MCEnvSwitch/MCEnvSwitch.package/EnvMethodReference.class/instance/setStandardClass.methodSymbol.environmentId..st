setting
setStandardClass: aClass methodSymbol: methodSym environmentId: envId
  aClass isMeta
    ifTrue: [ classSymbol := aClass instanceSymbol ]
    ifFalse: [ classSymbol := aClass name ].
  classIsMeta := aClass isMeta.
  methodSymbol := methodSym.
  stringVersion := aClass name , ' ' , methodSym.
  environmentId := envId