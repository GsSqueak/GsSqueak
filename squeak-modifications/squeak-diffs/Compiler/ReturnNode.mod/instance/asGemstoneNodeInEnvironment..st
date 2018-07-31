translating
asGemstoneNodeInEnvironment: env
  | gsReturnNode |
  gsReturnNode := (GemstoneSmalltalk _env0 at: #GsComReturnNode) _env0 new.
  ^ gsReturnNode _env0 returnFromHome: (self expr asGemstoneNodeInEnvironment: env)
