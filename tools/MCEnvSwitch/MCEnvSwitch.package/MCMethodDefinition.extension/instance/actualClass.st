*MCEnvSwitch
actualClass
  ^ self environmentToLoad
    at: className
    ifPresent: [ :class | 
      classIsMeta
        ifTrue: [ class class ]
        ifFalse: [ class ] ]