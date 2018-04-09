*MCEnvSwitch
environmentToLoad
  ^ ((MCEnv respondsTo: #'usesSqueakParser') and: [ MCEnv usesSqueakParser ])
    ifTrue: [ SqueakEnvironment ]
    ifFalse: [ Smalltalk ]