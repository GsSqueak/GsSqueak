translating
asGemstoneNodeInEnvironment: env
  | GsSendNode |
  GsSendNode := GsComSendNode new.
  GsSendNode
    stSelector: (self selector asGemstoneNodeInEnvironment: env);
    rcvr: (self receiver asGemstoneNodeInEnvironment: env).
  self arguments
    do: [ :argument | GsSendNode appendArgument: (argument asGemstoneNodeInEnvironment: env) ].
  self flag: #'toDo'.
  ^ GsSendNode