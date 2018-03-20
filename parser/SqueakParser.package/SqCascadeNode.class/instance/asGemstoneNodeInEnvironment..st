translating
asGemstoneNodeInEnvironment: env
  | gsNode |
  gsNode := GsComCascadeNode new
    rcvr: (self receiver asGemstoneNodeInEnvironment: env).
  self messages
    do: [ :message | gsNode appendSend: (message asGemstoneNodeInEnvironment: env) ].
  ^ gsNode