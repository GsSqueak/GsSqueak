translating
changesEnvironment
  (self startsWith: '_env')
    ifTrue: [ ^ self selector key last asDigit ]
    ifFalse: [ 
      self arguments
        ifNotEmpty: [ :args | 
          (args last isKindOf: MessageNode)
            ifTrue: [ ^ args last changesEnvironment ] ] ].
  ^ false
