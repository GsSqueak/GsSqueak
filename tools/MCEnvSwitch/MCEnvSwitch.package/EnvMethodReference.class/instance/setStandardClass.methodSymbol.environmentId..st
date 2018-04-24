setting
setStandardClass: aClass methodSymbol: methodSym environmentId: envId
  classSymbol := ((MCEnv respondsTo: #'usesSqueakParser')
    and: [ MCEnv usesSqueakParser ])
    ifTrue: [ aClass theNonMetaClass name ]
    ifFalse: [ aClass theNonMetaClass "no. You can't do that, we load this package before the parser. There is nothing in ENV 7 at that point. @env7:" name ]. 
  classIsMeta := aClass isMeta.
  methodSymbol := methodSym.
  stringVersion := aClass name , ' ' , methodSym.
  environmentId := envId
