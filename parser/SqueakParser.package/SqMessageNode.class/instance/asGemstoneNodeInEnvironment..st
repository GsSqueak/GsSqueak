translating
asGemstoneNodeInEnvironment: env
  | GsSendNode |
  GsSendNode := GsComSendNode new.
  GsSendNode environment: env.
  GsSendNode
    stSelector: (self selector asGemstoneNodeInEnvironment: env) inEnv: env;
    rcvr:
        (self receiver ifNotNil: [ self receiver asGemstoneNodeInEnvironment: env ]).
  self arguments
    do: [ :argument | GsSendNode appendArgument: (argument asGemstoneNodeInEnvironment: env) ].
  self flag: #'toDo'.
  ^ GsSendNode