*MCEnvSwitch
env: envId coreMethodsForClass: aClass
  ^ ((aClass selectorsForEnvironment: envId)
    difference:
      ((self env: envId foreignExtensionMethodsForClass: aClass)
        collect: [ :r | r methodSymbol ]))
    asArray
    collect: [ :sel | self referenceForMethod: sel ofClass: aClass environmentId: envId ]