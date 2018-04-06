*MCEnvSwitch
environmentToLoad
  ^ (MCEnv respondsTo: #'usesSqueakParser')
    ifTrue: [ SqueakEnvironment ]
    ifFalse: [ Smalltalk ]