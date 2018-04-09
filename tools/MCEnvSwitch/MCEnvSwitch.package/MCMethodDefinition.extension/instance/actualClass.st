*MCEnvSwitch
actualClass
  | environment |
  environment := (self respondsTo: #'environmentToLoad')
    ifTrue: [ self environmentToLoad ]
    ifFalse: [ Smalltalk ].
  ^ environment
    at: className
    ifPresent: [ :class | 
      classIsMeta
        ifTrue: [ class class ]
        ifFalse: [ class ] ]