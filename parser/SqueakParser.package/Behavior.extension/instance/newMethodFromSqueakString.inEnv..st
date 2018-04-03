*SqueakParser
newMethodFromSqueakString: aString inEnv: env
  | parser meth ast gsAst gsMethod class methDict |
  parser := SqParser new.
  ast := parser parse: aString class: self.
  gsAst := ast asGemstoneNodeInEnvironment: env.
  gsMethod := GsNMethod generateFromIR: gsAst.
  (self selectors contains: [ :sel | sel = gsMethod selector ])
    ifTrue: [ self _basicRemoveSelector: gsMethod selector environmentId: env ].
  methDict := self persistentMethodDictForEnv: env.
  methDict ifNil: [ methDict := GsMethodDictionary new ].
  methDict at: gsMethod selector put: gsMethod.
  self nonProtectedPersistentMethodDictForEnv: env put: methDict.
  self _codeChangedForEnv: env.
  System commit