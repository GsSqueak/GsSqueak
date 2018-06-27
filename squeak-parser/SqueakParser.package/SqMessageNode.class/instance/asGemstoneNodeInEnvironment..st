translating
asGemstoneNodeInEnvironment: env
  | gsSendNode primitive |
  (self selector startsWith: '_env')
    ifTrue: [ ^ self receiver asGemstoneNodeInEnvironment: env ].
  gsSendNode := GsComSendNode new.
  gsSendNode
    stSelector: (self selector asGemstoneNodeInEnvironment: env)
      inEnv: (self messageSendEnvironmentOr: env);
    rcvr:
        (self receiver ifNotNil: [ self receiver asGemstoneNodeInEnvironment: env ]).
  self arguments
    do: [ :argument | gsSendNode appendArgument: (argument asGemstoneNodeInEnvironment: env) ].
  gsSendNode sourceOffset: self sourceOffset.
  ((special ifNil: [ 0 ]) > 0
    and: [ 
      special < 5
        and: [ gsSendNode args allSatisfy: [ :arg | arg isKindOf: GsComBlockNode ] ] ])
    ifTrue: [ 
      [ gsSendNode optimize ]
        on: Error
        do: [  ] ].
  ^ gsSendNode
