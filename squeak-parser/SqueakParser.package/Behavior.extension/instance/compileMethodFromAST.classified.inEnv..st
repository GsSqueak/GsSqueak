*SqueakParser
compileMethodFromAST: ast classified: cat inEnv: env
  | parser meth gsAst gsMethod class methDict |
  gsAst := ast asGemstoneNodeInEnvironment: env.
  gsAst primitiveNumber < 2000
    ifTrue: [ ^ self _compileMethodFromAST: gsAst classified: cat inEnv: env ]
    ifFalse: [ 
      "use GS parser"
      self
        compileMethod: ast sourceText
        category: cat
        using: GsSession currentSession symbolList
        environmentId: env.
      ^ gsAst selector ]