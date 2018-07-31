translating
asGemstoneNodeInEnvironment: env
  | gsNode |
  gsNode := (GemstoneSmalltalk _env0 at: #GsComCascadeNode) _env0 new
    _env0 rcvr: (self receiver asGemstoneNodeInEnvironment: env).
  self messages
    do: [ :message | gsNode _env0 appendSend: (message asGemstoneNodeInEnvironment: env) ].
  ^ gsNode
