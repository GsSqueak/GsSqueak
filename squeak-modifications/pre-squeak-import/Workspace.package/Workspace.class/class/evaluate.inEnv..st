as yet unclassified
evaluate: aString inEnv: env
  | parser methodString meth ast gsAst gsMethod |
  parser := SqParser new.
  methodString := 'excecutedCode ^[' + aString + '] value'.
  ast := parser parse: methodString class: self.
  gsAst := ast asGemstoneNodeInEnvironment: env.
  (gsMethod := GsNMethod generateFromIR: gsAst) _isArray
    ifTrue: [ gsMethod := gsMethod first ].
  ^ self performMethod: gsMethod