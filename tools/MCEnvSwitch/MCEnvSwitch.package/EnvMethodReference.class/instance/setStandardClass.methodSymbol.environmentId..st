setting
setStandardClass: aClass methodSymbol: methodSym environmentId: envId
  classSymbol := ((MCEnv respondsTo: #'usesSqueakParser')
    and: [ MCEnv usesSqueakParser ])
    ifTrue: [ aClass theNonMetaClass name ]
    ifFalse: [ aClass theNonMetaClass @env7: name ].
  classIsMeta := aClass isMeta.
  methodSymbol := methodSym.
  stringVersion := aClass name , ' ' , methodSym.
  environmentId := envId