*MCEnvSwitch
actualClass
  | environment |
  environment := (self respondsTo: #'environmentToLoad')
    ifTrue: [ self environmentToLoad ]
    ifFalse: [ Smalltalk ].
  ^ environment classNamed: self className