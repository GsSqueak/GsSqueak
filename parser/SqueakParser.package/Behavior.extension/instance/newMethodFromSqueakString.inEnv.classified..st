*SqueakParser
newMethodFromSqueakString: aString inEnv: env classified: aProtocol
  | parser meth ast gsAst gsMethod class methDict |
  parser := SqParser new.
  ast := parser parse: aString class: self.
  gsAst := ast asGemstoneNodeInEnvironment: env.
  gsMethod := GsNMethod generateFromIR: gsAst.
  (self selectorsForEnvironment: env)
    contains: [ :sel | sel = gsMethod selector ].
  methDict := self persistentMethodDictForEnv: env.
  methDict ifNil: [ methDict := GsMethodDictionary new ].
  methDict at: gsMethod selector put: gsMethod.
  self nonProtectedPersistentMethodDictForEnv: env put: methDict.
  self _codeChangedForEnv: env.
  self classify: gsMethod selector under: aProtocol environmentId: env.
  System commit