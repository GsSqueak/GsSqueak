translating
asGemstoneNodeInEnvironment: env
  | gsSendNode primitive |
  (self selector key startsWith: '_env')
    ifTrue: [ ^ self receiver asGemstoneNodeInEnvironment: env ].
  gsSendNode := (GemstoneSmalltalk _env0 at: #GsComSendNode) _env0 new.
  gsSendNode _env0
    stSelector: (self selector asGemstoneNodeInEnvironment: env)
    inEnv: (self messageSendEnvironmentOr: env).
  gsSendNode _env0 rcvr:
    (self receiver ifNotNil: [ self receiver asGemstoneNodeInEnvironment: env ]).
  self arguments
    do: [ :argument | gsSendNode _env0 appendArgument: (argument asGemstoneNodeInEnvironment: env) ].
  gsSendNode _env0 sourceOffset: 0.
  gsSendNode _env0 optimizeIfPossible.
  ^ gsSendNode
