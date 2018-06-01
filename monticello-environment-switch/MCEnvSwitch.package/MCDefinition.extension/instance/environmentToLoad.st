*MCEnvSwitch
environmentToLoad
  ^ ((MCEnv respondsTo: #'usesSqueakParser') and: [ MCEnv usesSqueakParser ])
    ifTrue: [ Smalltalk at: #'SqueakEnvironment' ]
    ifFalse: [ Smalltalk ]