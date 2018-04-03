*SqueakParser-Dependencies
newMethodFromSqueakString: aString inEnv: env
  | parser meth ast gsAst gsMethod class |
  parser := SqParser new.
  ast := parser parse: aString class: self.
  gsAst := ast asGemstoneNodeInEnvironment: env.
  gsMethod := GsNMethod generateFromIR: gsAst.
  (self selectors contains: [ :sel | sel = gsMethod selector ])
    ifTrue: [ self _basicRemoveSelector: gsMethod selector environmentId: env ].
  (self persistentMethodDictForEnv: env) at: gsMethod selector put: gsMethod.
  self _codeChangedForEnv: env.
  System commit