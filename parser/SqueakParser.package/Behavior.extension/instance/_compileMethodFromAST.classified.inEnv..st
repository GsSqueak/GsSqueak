*SqueakParser
_compileMethodFromAST: gsAst classified: cat inEnv: env
  | gsMethod methDict |
  (gsMethod := GsNMethod generateFromIR: gsAst) _isArray
    ifTrue: [ gsMethod := gsMethod first ifNil: [ self error: gsMethod second first fourth ] ].
  self removeSelector: gsMethod selector environmentId: env ifAbsent: [  ].
  methDict := self persistentMethodDictForEnv: env.
  methDict ifNil: [ methDict := GsMethodDictionary new ].
  methDict at: gsMethod selector put: gsMethod.
  self nonProtectedPersistentMethodDictForEnv: env put: methDict.
  self _codeChangedForEnv: env.
  self classify: gsMethod selector under: cat environmentId: env.
  ^ gsMethod selector