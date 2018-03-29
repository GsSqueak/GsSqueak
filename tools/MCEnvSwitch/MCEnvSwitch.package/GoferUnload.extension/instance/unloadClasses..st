*MCEnvSwitch
unloadClasses: aWorkingCopy
  (aWorkingCopy packageInfo methodsEnv: MCEnv current)
    do: [ :each | 
      (each classIsMeta and: [ each methodSymbol = #'unload' ])
        ifTrue: [ each actualClass theNonMetaClass unload ] ]