code generation
generate
    | gsAst gsMethod |
    gsAst := self asGemstoneNodeInEnvironment: 7.
    gsMethod := (GemstoneSmalltalk _env0 at: #GsNMethod) _env0 generateFromIR: gsAst.
    gsMethod _env0 _isArray ifTrue: [
        gsMethod := gsMethod _env0 first.
        gsMethod ifNil: [
            self error: gsMethod _env0 second _env0 first _env0 fourth ]].
    ^ gsMethod
