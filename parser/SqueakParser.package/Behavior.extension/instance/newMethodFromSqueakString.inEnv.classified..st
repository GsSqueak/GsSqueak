*SqueakParser
newMethodFromSqueakString: aString inEnv: env classified: aProtocol
  | parser meth ast gsAst gsMethod class methDict |
  parser := SqParser new.
  ast := parser parse: aString class: self.
  gsAst := ast asGemstoneNodeInEnvironment: env.
  (gsMethod := GsNMethod generateFromIR: gsAst) _isArray
    ifTrue: [ gsMethod := gsMethod first ].
  self removeSelector: gsMethod selector environmentId: env ifAbsent: [  ].
  methDict := self persistentMethodDictForEnv: env.
  methDict ifNil: [ methDict := GsMethodDictionary new ].
  methDict at: gsMethod selector put: gsMethod.
  self nonProtectedPersistentMethodDictForEnv: env put: methDict.
  self _codeChangedForEnv: env.
  self classify: gsMethod selector under: aProtocol environmentId: env
