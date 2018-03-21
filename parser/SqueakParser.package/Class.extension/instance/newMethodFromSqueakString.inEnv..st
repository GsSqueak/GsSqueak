*SqueakParser-Dependencies
newMethodFromSqueakString: aString inEnv: env
  | parser meth ast gsAst gsMethod class |
  parser := SqParser new.
  ast := parser parse: aString class: self.
  gsAst := ast asGemstoneNodeInEnvironment: env.
  gsMethod := GsNMethod generateFromIR: gsAst.
  (self persistentMethodDictForEnv: env) at: gsMethod selector put: gsMethod