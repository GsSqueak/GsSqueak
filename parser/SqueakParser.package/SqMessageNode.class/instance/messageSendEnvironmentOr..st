translating
messageSendEnvironmentOr: stdEnvironment
  | env |
  ((self receiver isKindOf: SqMessageNode)
    and: [ (env := self receiver changesEnvironment) isNumber ])
    ifTrue: [ ^ env ]
    ifFalse: [ ^ stdEnvironment ]