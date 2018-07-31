translating
messageSendEnvironmentOr: stdEnvironment
  | env |
  ((self receiver isKindOf: MessageNode)
    and: [ (env := self receiver changesEnvironment) isNumber ])
    ifTrue: [ ^ env ]
    ifFalse: [ ^ stdEnvironment ]
