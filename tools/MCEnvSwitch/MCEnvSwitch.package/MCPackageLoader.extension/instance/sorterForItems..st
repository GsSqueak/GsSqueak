*MCEnvSwitch
sorterForItems: aCollection
  | sorter |
  sorter _ MCDependencySorter items: aCollection.
  sorter addExternalProvisions: self provisions.
    MCEnv usesSqueakParser
    ifTrue: [ sorter addExternalProvisions: (Smalltalk at: #SqueakEnvironment) keys ].
  ^ sorter
