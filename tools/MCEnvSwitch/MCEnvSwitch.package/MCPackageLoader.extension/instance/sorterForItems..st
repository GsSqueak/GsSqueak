*MCEnvSwitch
sorterForItems: aCollection
  | sorter |
  sorter _ MCDependencySorter items: aCollection.
  sorter addExternalProvisions: self provisions.
  sorter addExternalProvisions: SqueakEnvironment keys.
  ^ sorter